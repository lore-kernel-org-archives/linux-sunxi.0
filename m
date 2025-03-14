Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FAF78F2E;
	Fri, 14 Mar 2025 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967571; cv=none; b=CTsvOG/ISi7hYWVg3awpBfITF8Z6b5hBopNvouNm6K5WENxsxx3e11pK+0rclfurKrtgYBrUUANVXGjil5mogwoMRuLNaHAyUsE6NqCsXz2zZoA2Snqc7TYg1U2LnxTFFf39raywPIZ8Cf+8lSTIA2X0+D2ZBm+JpTtqudP2jxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967571; c=relaxed/simple;
	bh=NX2Md3U+bOQqXplBc113iIeIOo0t7MlCS1wk9cRyyQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UDVuRglTKoLjjknTQBfkQo/0L/V2r3wFKIkVfgfSYHmPafs0e0JwaF5ZqZMjiuCqyqx0LM2BICive83mncrtU0xn+NBpI8RIsHEpw5sC4xbmndL7TJu+On7gAnxpEalcAkGnIOubjO9gHbfnyMtkDT8DBwafw7493QPGLUGbnn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPhKdtTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPhKdtTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A853DC4CEEF;
	Fri, 14 Mar 2025 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967571;
	bh=NX2Md3U+bOQqXplBc113iIeIOo0t7MlCS1wk9cRyyQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NPhKdtTm7NG1HkUBT/Jq2uCczGCk9Wmqy6J8QpukK834sVNxdFMogsT2Kz/1XvsxX
	 vfwd8AlClj7x8WL/PgnLGupjmPZJGy82k91wsITI+doXcODNdSeswtkkZEbzzzAV5t
	 3GDEeIdWP7fivabiK1LudxjvHhgUEfC+Xw1ZJt5Z4V5SG96gfzmLHNb13qIBI1SDQC
	 p6iBbIrSohhG+XkBo2FA+PPrw3NKq2quBIR42d2JGampBA+Iytk2SLfs18+PXF4szX
	 ktsXmp17cb4LT3j1s+t2THn6I2v8nOAQ+O4WzwLLR0FHrtGeCK1OvLLD1FcBZD5emC
	 CCRS192mPvFKA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
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
Message-Id: <174196756840.19728.17664266192768404946.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 15:52:48 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
      commit: 7bda89a2489fb012c4c63f3338827ad1f35c8880
[2/5] ASoC: sun4i-codec: correct dapm widgets and controls for h616
      commit: ae5f76d4044d1580849316c49290678605e0889d
[3/5] ASoC: sun4i-codec: support hp-det-gpios property
      commit: a149377c033afe6557c50892ebbfc0e8b7e2e253
[5/5] ASoC: sun4i-codec: add h616 card long_name
      commit: d389719fb4ece17ea28c0cf908066815d3ab0e25

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

