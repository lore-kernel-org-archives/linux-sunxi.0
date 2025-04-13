Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3DE78F4C;
	Sun, 13 Apr 2025 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557471; cv=none; b=fV6MBOxAItipCMIaLS3cJwn9MFeQiZUKo5q6Mv3AnGn8mUd2cGJ4F+9MYtk/KpLenovV0oASF/rme7lAT5sqforGRa1omG9uMuB2MFEeUbQ85Zb0I4n418mRgnP6sLi50gY/aKftvr/tAkN6bfo5myL2CouglHLFwfBNB50wuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557471; c=relaxed/simple;
	bh=Cv0w0H6kJ9nxtclidW3FK/DftZmrxBW+wuvDWOY6/g4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C4nzUPdyXaw6YL0vic74mcoweKf+U7rPjkEoGaZ8uqulC+tHBM8DEYYQaRPHav7ZU//hEb9ismLGSjUn/1tMm0TuoSkGjO9jy9eWicOGQszxQOM6fSQ/MqBRKfhXt3KOgCOABBz3Sb29MXElFrwb9zYqu9H7YAWT68ttbGDgG3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232A3C4CEDD;
	Sun, 13 Apr 2025 15:17:51 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 0DCE75F939;
	Sun, 13 Apr 2025 23:17:48 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v3 0/5] ASoC: sun4i-codec: add headphone
 dectection for Anbernic RG35XX devices
Message-Id: <174455746802.3439512.6704778087672497474.b4-ty@csie.org>
Date: Sun, 13 Apr 2025 23:17:48 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sat, 15 Feb 2025 11:02:22 +1300, Ryan Walklin wrote:
> V3 of this patch adding headphone jack detection support to the Anbernic RGnnXX series of handhelds. V3 corrects my misunderstanding of derivation of ALSA UCM file paths, and adds recieved Reviewed-by and Tested-by tags. Thanks to those that have reviewed and fed back on previous versions.
> 
> Original message below:
> 
> This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.
> 
> Thanks to Chris Morgan for his assistance putting this series together.
> 
> [...]

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[4/5] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
      commit: 69714722df19a7d9e81b7e8f208ca8f325af4502

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

