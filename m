Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752D77F
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 09:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F57C433D6;
	Wed, 14 Sep 2022 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663148415;
	bh=NON4s+poYWHm0+VBJ/uGgY91L7qbBPDPpCAWUeFl1lQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=klEq28NYTOqDeVhY2NdGRM0PlDlswUR5qIWh+2AWYNxJdn7RcOBnjqEnUi+RONow2
	 WFdL1AeUbgwrXcS9+mMNx8q1f1g6141YjXiX6e9j2Jke5BWWE5im8tT1lnwDpcgWNr
	 vIkviUNK34/7W6Bs9WL/J/fcvEtrLgfMkyo9bINmuzWG0et2ddXfKCPUoFO+gxfLwy
	 Nla7cSqNNS33XLMVlsOCja3hJdBRTMzKFN2W9dr8L28gXBvD8JqGc6GBJrT5kl12RO
	 f51sJmQjqJENyb2tDNlhOA4Yq8hCq69MRPZhSiiPNs6zkhhkb4SHaItJNRGF+BF8xV
	 cvuHCLGYiSV0g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mikhail Rudenko <mike.rudenko@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220911145713.55199-1-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in probe
Message-Id: <166314841203.314266.13063838088895693930.b4-ty@kernel.org>
Date: Wed, 14 Sep 2022 10:40:12 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade

On Sun, 11 Sep 2022 17:57:11 +0300, Mikhail Rudenko wrote:
> In the case when a codec device is probed before codec analog
> controls, snd_soc_register_card() returns -EPROBE_DEFER, resulting in
> a misleading error message
> 
>     sun4i-codec 1c22c00.codec: Failed to register our card
> 
> even if the device is probed successfully later. Use dev_err_probe()
> to demote the above error to a debug message.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: sunxi: sun4i-codec: silence misleading error in probe
      commit: 30248f618d30cf1ad9d5a72126799f2f0239860c
[2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU DAI component
      (no commit info)

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
