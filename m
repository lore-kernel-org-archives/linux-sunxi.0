Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255B92F80
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 06:14:25 +0000 (UTC)
IronPort-SDR: Olu/+AjFDn7GtX6glppbT6ABlgTVZf/tDv2QLUcTAF9uiSANj24lXSKxCRaHCoSCYB8N7yZEz4
 uL6KC84SSzdw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205286612"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="205286612"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 23:14:25 -0700
IronPort-SDR: h5+j9tlTYAkiuLwnJSsZ4jJNEobHHQIJP+88YF4O2KdUC3PC9DgD1OxUohQa4I+6aprQoeRK33
 RomsYDuWWJLg==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="486479013"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 23:14:15 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 23EA42036A;
	Fri, 11 Jun 2021 09:14:13 +0300 (EEST)
Date: Fri, 11 Jun 2021 09:14:13 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <a.hajda@samsung.com>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Pavel Machek <pavel@ucw.cz>, Shawn Tu <shawnx.tu@intel.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Heungjun Kim <riverful.kim@samsung.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
	Hyungwoo Yang <hyungwoo.yang@intel.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Petr Cvek <petrcvekcz@gmail.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mickael Guene <mickael.guene@st.com>,
	Mats Randgaard <matrandg@cisco.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Robert Foss <robert.foss@linaro.org>,
	Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Helen Koike <helen.koike@collabora.com>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Benoit Parrot <bparrot@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v5 0/9] media: v4l2-subdev: add subdev-wide state struct
Message-ID: <20210611061413.GM3@paasikivi.fi.intel.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Moi,

On Thu, Jun 10, 2021 at 05:55:57PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> v5 of the series. No content changes compared to v4, but the series is
> split into smaller parts to enable reviews.
> 
> The split is artificial, and all the patches need to be squashed into
> one before merging.
> 
> The point of the series is explained in "media: v4l2-subdev: add
> subdev-wide state struct", but for easier reviews I add it partially
> here:
> 
> We have 'struct v4l2_subdev_pad_config' which contains configuration for
> a single pad used for the TRY functionality, and an array of those
> structs is passed to various v4l2_subdev_pad_ops.
> 
> I was working on subdev internal routing between pads, and realized that
> there's no way to add TRY functionality for routes, which is not pad
> specific configuration. Adding a separate struct for try-route config
> wouldn't work either, as e.g. set-fmt needs to know the try-route
> configuration to propagate the settings.
> 
> This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
> moment only contains the v4l2_subdev_pad_config array) and the new
> struct is used in most of the places where v4l2_subdev_pad_config was
> used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
> are changed to instead take v4l2_subdev_state.

Thanks for the update.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Terveisin,

Sakari Ailus
