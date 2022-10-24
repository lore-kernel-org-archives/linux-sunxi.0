Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769D7B
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Oct 2022 14:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C74DC433D6;
	Mon, 24 Oct 2022 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666620120;
	bh=pNwuaU1Ukcpu+2WY7FOqGXayA5lGqbb30IfbM7hnsHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EmVx/iDvv3b0A31uPTIJbXEwiPmYCrMxxgvtk0/N6LcykmG/6kiO3KW7rJjoITGDX
	 jEJbUqjCWOr87OiQeqv+TORr/zhDoRuCo3tXQ1w5fUmIgEKSqG9QqWDzgSFoqAHLNR
	 p0WP+MxEfpoO33CA8XLZ62Lpn41EoS6XiTtQh6LC+xR5wvv2ravMbo3WnVvd4vn3ho
	 uB4B5JsjrjRShNYreRERf9V2MLlBxhZsZZLWgy8sBjepfb+5o/DtI0IB+Xty6z7Qh2
	 T3xIH/jDfvoIKsldCuYQ21KEg4HBW69CAU3tcezG80QP8xDDgThmz+qiCiJLoPZBOz
	 Sya0su8WFyROA==
From: Mark Brown <broonie@kernel.org>
To: samuel@sholland.org, lgirdwood@gmail.com, Ban Tao <fengzheng923@gmail.com>, perex@perex.cz, jernej.skrabec@gmail.com,
 tiwai@suse.com, wens@csie.org
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <1666511085-2748-1-git-send-email-fengzheng923@gmail.com>
References: <1666511085-2748-1-git-send-email-fengzheng923@gmail.com>
Subject: Re: [PATCH v2] ASoC: sun50i-dmic: avoid unused variable warning for sun50i_dmic_of_match
Message-Id: <166662011789.251784.4030037448307420483.b4-ty@kernel.org>
Date: Mon, 24 Oct 2022 15:01:57 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921

On Sun, 23 Oct 2022 00:44:45 -0700, Ban Tao wrote:
> In configurations with CONFIG_OF=n, we get a harmless build warning:
> 
> sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
> 'sun50i_dmic_of_match' [-Wunused-const-variable]
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun50i-dmic: avoid unused variable warning for sun50i_dmic_of_match
      commit: 2cfcc1085d3b7b7c893be41034853d4c63a41092

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
