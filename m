Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5F46B0
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jun 2022 10:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1194C341C0;
	Tue, 14 Jun 2022 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655202314;
	bh=/4wjBN/XD9r9d8fn277nelFLTt+axEseUdjXrsmW1cU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JdeSQWXLchu9QxQUVDqhSTbVyAhOjuRuArsn0syriXa+9Qq9BrxzCpSbML5WI6MvX
	 rieOOwWnvg/qq0YjsQmfXXIgeK6bx8mQHr+Cp7jItHCN2TGh12ndouxY2FFFPOMzoV
	 OIj9Mb9xNVeeg7e7EYjwZAe452Iwx8BRu9WNpRbfAaEvucIA6+u0M2XLRpTQgF4owu
	 hkJKkhk4nlzqH98aZNLkIRN8piFSAYzExErE7j+l41MzNbTwRZ3EqFPXUSTgcaT58B
	 RjsjdaMcL3qclOjPvMSkjIE7/PkiKj4D6GIXIZdSp95ObCXd5jSt0nEnh7dDi9Gs33
	 rlAatUrbYIFqw==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com, samuel@sholland.org
Cc: linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, patches@opensource.cirrus.com, jernej.skrabec@gmail.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, wens@csie.org, lgirdwood@gmail.com, matthias.bgg@gmail.com
In-Reply-To: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock specifiers
Message-Id: <165520231251.3607327.1586830877046934824.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:12 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 13 Jun 2022 17:15:51 +0100, Charles Keepax wrote:
> Recent updates accidentally updated the clock producer/consumer
> specifiers on this device as part of refactoring the CPU side of the DAI
> links. However, this device sits on the CODEC side and shouldn't have
> been updated. Partially revert the changes keeping the switch to the new
> clock terminology but going back to the CODEC defines.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sun8i-codec: Partial revert to fix clock specifiers
      commit: beb89d1d49e9ae1188356d6e37581e5f0b5f62b4
[2/2] ASoC: mediatek: mt8186: Use new direct clock defines
      commit: 845a215558647acd4290dd773b9c0de62c123335

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
