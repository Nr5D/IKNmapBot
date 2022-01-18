# Create Twitter token
IKNmapBOT_token <- rtweet::create_token(
  app = "IKNmap",
  consumer_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

# Generate random coordinates within specific limits
lon <- round(runif(1, 106.688063, 106.968928), 4)
lon <- format(lon, scientific = FALSE)
lat <- round(runif(1, -6.350871, -6.101472), 4)

# Build URL and fetch image from Mapbox API
img_url <- paste0(
  "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/static/",
  paste0(lon, ",", lat),
  ",15,0/600x400@2x?access_token=",
  Sys.getenv("MAPBOX_PUBLIC_ACCESS_TOKEN")
)

# Download the image to a temporary location
temp_file <- tempfile()
download.file(img_url, temp_file)

# Geocoding Point (from @esmapbot)
location = paste0("https://api.mymappi.com/v2/geocoding/reverse?apikey=",Sys.getenv("MYMAPPI_PUBLIC_TOKEN"),paste0("&lat=",lat,"&lon=",lon))
address = jsonlite::fromJSON(location, flatten = TRUE)
text = address$data$display_name

# Build the Twitter status message (text and URL)
if (is.null(text)) { message <- paste0(
  "📍 ¿Coba Tebak? \n", "\n",
  "🌐 ",lat, ", ", lon, "\n",
  "🗺️ ","https://www.google.com/maps/@", lat, ",", lon, ",16z"
)} else { message <- paste0(
  "📍 ", text, "\n", "\n",
  "🌐 ",lat, ", ", lon, "\n",
  "🗺️ ","https://www.google.com/maps/@", lat, ",", lon, ",16z"
)}

# Post the image to Twitter
rtweet::post_tweet(
  status = message,
  media = temp_file,
  token = IKNmapBOT_token
)
