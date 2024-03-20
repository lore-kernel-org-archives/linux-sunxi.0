Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68856B89;
	Wed, 20 Mar 2024 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710951664; cv=none; b=BIqRYbfLJFJD9+1worGuDNRbVxxbAhOkbtG8B6WPEcXyKzsW/kp6FoRJFI3mRkvpLL763EfXqS8met5yHmG0x1RnPoc19C1eidtVR/UhX9Mo8lGmGfMEpyve+PHdv/9viNU4yH3eRu1ZeHaQ4LB5Y69jOYijXHXHq7679IEHEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710951664; c=relaxed/simple;
	bh=SGKbHXx9GhYI1qyjfaaZUxa8KlMBS5mpkV54mHCA1kM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=jrht+yxL7GnyQG+kkij8ZWSG24AiwihJPMmORCOQrydHx2QojCo4RPK6AH5I/PlZWVr1JT4iciPomjp8PXbKaOTPf4fOswQKNA/5gopfCBn+2ozez0bYvWyopyQcRjCJhdobq3xAp9LfLpGFRkKPZc8ul/B3I3csdhiv0tUnSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwgMsq53; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwgMsq53"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD26AC433C7;
	Wed, 20 Mar 2024 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710951664;
	bh=SGKbHXx9GhYI1qyjfaaZUxa8KlMBS5mpkV54mHCA1kM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NwgMsq53JeZlshJ72slYZRRvOR7tc+DhdXbwD5Qp+SQUcOFslmSYsz3q+kzGTgt7/
	 FB89dwh/oVZks87Kf7f+wmJihmqF+QPSzxGs9gidfF2eJJZPGcoVtOuEsIDYZrTIUd
	 ukmy/BT+Y5o/Wvd6nKSk8PZl6XEE01GPn99jiA4Er6P4KpZ/DAgJywUjM0oW20AYIc
	 I732n40K7zT2YiLLxpXTl0huILNUhA0L0QsfNqEDjN8vkzOkk5JUK3Bpbaqd6RqAjP
	 sWlqIQ0izWXyjtYTbFP4qveCavJFR4mlB7iBSJpQhFvYIXb6wVEebnsLjWBqIW5opd
	 tP5NN1AK/+TyA==
Date: Wed, 20 Mar 2024 11:21:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Pavel_L=C3=B6bl?= <pavel@loebl.cz>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wens@csie.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20240320001152.4077150-1-pavel@loebl.cz>
References: <20240320001152.4077150-1-pavel@loebl.cz>
Message-Id: <171095148684.1943272.17283470654158577343.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] dt-bindings: arm: sunxi: Add Banana Pi P2 Zero
 v1.1


On Wed, 20 Mar 2024 01:11:45 +0100, Pavel Löbl wrote:
> Adding support for Add Banana Pi P2 Zero v1.1 from Sinovoip.
> 
> V2: Added Fixes: tag to 1/3 to reference the commit which introduced
>     the duplication.
> 
>     Fixed all issues found by dtbs_check, except "cpu-hot-limit" regexp
>     which is there for all H2/H3 boards.
> 
>     Switched back to "usb0_id_det-gpios" for role detection. In one submission
>     Rob suggested this should be replaced with usb connector node. But as
>     I understand the code, connector node approach is currently not supported
>     by the sunxi phy driver.
> 
> Signed-off-by: Pavel Löbl <pavel@loebl.cz>
> ---
> Pavel Löbl (3):
>   ARM: dts: sunxi: remove duplicated entries in makefile
>   dt-bindings: arm: sunxi: Add Banana Pi P2 Zero v1.1
>   ARM: dts: sun8i: h2+: add support for Banana Pi P2 Zero board
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   6 +
>  arch/arm/boot/dts/allwinner/Makefile          |  63 +---
>  .../sun8i-h2-plus-bananapi-p2-zero-v1.1.dts   | 287 ++++++++++++++++++
>  3 files changed, 294 insertions(+), 62 deletions(-)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dts
> 
> --
> 2.39.2
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dtb' for 20240320001152.4077150-1-pavel@loebl.cz:

arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-hot-limit' does not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#





