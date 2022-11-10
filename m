Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DBB626
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 07:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595EAC433C1;
	Thu, 10 Nov 2022 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668065743;
	bh=TaM1TxLO3us2TGPm08YT2OLxKkm7+1jQOLmHX+nTxUs=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=FhuMbQ73heOT2dapg/pppR1HmLpIQJVtocv4fdf8y5qcOBLmyQ6M96SahddpTJQXD
	 4HoHfKCdOwiRJwWJ0mwmEzHiYA1kRAzrHGIldZNGhfwxtd+AqTSv6XCV7ipYosiNWM
	 t8Tlyt7afMq2oww/GYt1NvoS6mvZv6iEAeqkLCGTxLX4jX/IPPKQu7GDpPBGSsw24W
	 HxrAhF//fyG2YvLIJwfSYC5WBgEaYaiBQEnPsQz0MX1sPynScUHY+TPyhlzR/q7DXo
	 lzT/cUP02ZpkKOm6KaGAdQIx5noxUtGStIHCaNn4nfgDbYCO9GnBU6lxzYe6vsrbPh
	 KZeMAiedIVp4w==
Date: Thu, 10 Nov 2022 13:05:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on
 F1C100s SoC
Message-ID: <Y2ypy0CM8rJGu2g4@matsya>
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106154826.6687-4-andre.przywara@arm.com>

On 06-11-22, 15:48, Andre Przywara wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> 
> Add support for its USB PHY.

This does not apply for me, please rebase and resend

Also, consider splitting phy patches from this. I dont think there is
any dependency

-- 
~Vinod
