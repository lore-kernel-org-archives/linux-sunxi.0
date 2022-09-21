Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F31102
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Sep 2022 12:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FA9C433D7;
	Wed, 21 Sep 2022 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663763877;
	bh=supMv855KnyburSSx3KwyTUOX8zU5PSNqbdh6ZA3Vz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WZDZuujrMgbAZ0EtjjBEvWI5Ft+3VTLbXG8OKqfuMqpwAuC+EJt8lw4U0viNvEXSD
	 qL/3cVIUW/eMV6lPZ46skTL5Q1JyhJ96bXYX73et6xBHYUwdWpaR+ZA/NCBZJ6vk3F
	 ls+hA9TbIkQDsJnrDyPceXkkKcm4jnFhwWrgOnMExwJpVt+DonbjhuYXLHqyejPIpB
	 V4dQ3uwFBqFGSAkZdrT6eJjabTJtPncSq0B7uTxNikFhokt4aAgGB4f5k2h5G6Hl3Y
	 9d2QPW2KO+ZtGJKlCuZ4vteUBI/3mUxE+U3f/+uDxKz41SySBNi4W4lTc99bNeQgcc
	 wtMpvwh/RxvPQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, fengzheng923@gmail.com, lgirdwood@gmail.com, Zeng Heng <zengheng4@huawei.com>,
 jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, wens@csie.org, samuel@sholland.org
Cc: liwei391@huawei.com
In-Reply-To: <20220921033819.2188233-1-zengheng4@huawei.com>
References: <20220921033819.2188233-1-zengheng4@huawei.com>
Subject: Re: [PATCH -next] sound: sunxi: fix declaration compile error
Message-Id: <166376386829.569475.6485211079114910926.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 13:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31

On Wed, 21 Sep 2022 11:38:19 +0800, Zeng Heng wrote:
> Just fix compile error without any logic changes.
> 
> sound/soc/sunxi/sun50i-dmic.c:62:1: error: ‘static’ is not at beginning of declaration [-Werror=old-style-declaration]
>    62 | const static struct dmic_rate dmic_rate_s[] = {
>       | ^~~~~
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] sound: sunxi: fix declaration compile error
      commit: ee81cfb58286c1aed3263d2fc94b321e7d963f08

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
