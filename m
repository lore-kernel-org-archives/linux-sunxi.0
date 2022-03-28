Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D607C;
	Mon, 28 Mar 2022 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648456211;
  x=1679992211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6lodqU722XqqMCnjzMd3/cpwy1KHIQLMRjx1NSCdEKA=;
  b=XAmZvhXBenZfQv/0ZlWrqduYQsJ6FgkBouxBW6IQH3ep0wt8o/75MpOQ
   zo1B+OAV4l/N4DaV6umlMRMkga7MKrA0V6U/WQC6DtYg2EFW0AZti7Mad
   OeKj6x9k/vLbR2x6VP8WdAu7EnS2XvMrUujvPpb3HMg4YW7aZrgVYY6lP
   koxkwJzigbhbOLG88flhTDJyzy0iCiNLTNK+Y46FQ9CZstF1aKhEoeCDH
   8oy72hGHFeHRomhgx6VSjMB5RNw2ntMCBw9B3+yQkScqRaxFo/chA1M6T
   KwbEDu3LDMhAxoGAp4XOv3Uo0BHaG1ahEqJnCWQyc5XYMvYU+LDTMdVoa
   g==;
Date: Mon, 28 Mar 2022 10:28:58 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Ansuel Smith <ansuelsmth@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-actions@lists.infradead.org"
	<linux-actions@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, linux-arm-kernel
	<linux-arm-kernel@axis.com>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-rpi-kernel@lists.infradead.org"
	<linux-rpi-kernel@lists.infradead.org>, "chrome-platform@lists.linux.dev"
	<chrome-platform@lists.linux.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "kernel@dh-electronics.com"
	<kernel@dh-electronics.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-oxnas@groups.io"
	<linux-oxnas@groups.io>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-unisoc@lists.infradead.org"
	<linux-unisoc@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <20220328082858.GJ7371@axis.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ansuel,

On Mon, Mar 28, 2022 at 02:09:15AM +0200, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
> [...]
>  arch/arm/boot/dts/axix/Makefile               |    3 +
>  .../boot/dts/{ => axix}/artpec6-devboard.dts  |    0
>  arch/arm/boot/dts/{ => axix}/artpec6.dtsi     |    0

All ARTPEC platforms should be in a directory called "axis".
Otherwise LGTM.

Thanks!

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
