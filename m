Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB5A31
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Sep 2022 23:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E82C43470;
	Mon, 19 Sep 2022 23:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663629041;
	bh=b1MqEh6B42D87J4TSbATtghLyrLWxYN99xDJ54qoJjU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KI1qtB8dtbf2FWe6H6nRxplkR+NFVCp3Fa07+UpVQle4opGMzGzwsl7MKYGYnmQs+
	 Mhk9JCWW2EDm3w8V7xI5QXHzf2VwBS/dWd03/tgajaTxJ8+ToxR9MtEPf4YlPxR/j8
	 U3MBfXV0vt73WHMLljw6baL9kynOtDE2Zxv/x/BrgsDrauzgreTminioG5Sxr2vaqL
	 XJe2gEuEHNlsgfBoNnN6DoYtWh4FBx2yZsHcDFP25wNeR1Qp734KFoGd3554cLOX02
	 xgqopEYOSK6Zaa+SuYAl173l9b8QhlIFPf4P2UJQr92xIdOrzKWbkF3pGaQh6GK3y6
	 1sMPXQ+BtELVQ==
From: Mark Brown <broonie@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>, robh+dt@kernel.org, jernej.skrabec@gmail.com, wens@csie.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, krzysztof.kozlowski+dt@linaro.org, samuel@sholland.org
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <1662966333-18000-1-git-send-email-fengzheng923@gmail.com>
References: <1662966333-18000-1-git-send-email-fengzheng923@gmail.com>
Subject: Re: [PATCH v10 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Message-Id: <166362903874.3419825.606503427543635077.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:38 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31

On Mon, 12 Sep 2022 00:05:33 -0700, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
      commit: 5cf934e84659ca2f03db6254978d56f053745366

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
