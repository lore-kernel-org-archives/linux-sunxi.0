Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52B1CEAC8;
	Tue, 14 Jan 2025 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736872535; cv=none; b=FHSWWTsAu04YpCNmND1BV5ivJ2J0lraoGQ/nNR/eWc0qohFzgwELX0Q3GjIJYtr8DjsvM1UffrnjxA0pON6ARaS9VS/9ssXY0u/WrJ69y7V8ET14N13FZTZwDSCiTJ8MLCJnLCo7kLPGfGVvpFLHSpFneprDTGOWGt0PcWUtVOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736872535; c=relaxed/simple;
	bh=Elen7iUmj/EPR3RMtRSgFS7j/YgmhA9JWL4WxMVNBM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rv57HC9KZ/q3KoVLhuHQCfRDwYWCMkLlI8v2mldaecMZnigtdYvg97M0Y6Ndc2pR8d/RzoDaLtu49nmWU6kssJCGH9geuKjCDzgFuZiIzs3OqYqOIQj/dLCsdB6fdDUnO7e9aNSuEJWdVUO5xt/BcnKu6QEYzKGWGveZFRqHBHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rkat0leY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rkat0leY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE78C4CEDD;
	Tue, 14 Jan 2025 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736872535;
	bh=Elen7iUmj/EPR3RMtRSgFS7j/YgmhA9JWL4WxMVNBM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rkat0leYsLAj5X6N28+LDl2UqlEzxJRcN9aWFzt6cDS/MmmYPLJXUQjUP+UQSXitK
	 WKUZB2sW4EK2OvSyMpxRwMlRjF9PsWkX0ut0jOuQuqrBqQSeCSi3FUSXByOIUnepwR
	 FOS/85CRD8c4yESOa5xQBVrWAZv7/7D7Avi8MaJkIJG3aSlvn80Y52Wn1Ydk33lCtj
	 guY9CwiOfe+I0yhCfh59C8/eiX1b5fKx5nyP+6gHwa6uoOcQtnpU4p6q+VuWga+qBf
	 eOcpX//sI9TZEcIKGrZuHf7YgKlG+idTxKBpv7a7jNvSWXuEOSm4vs7rGwbIwCUVm9
	 IS6F6caqkMeug==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20250114095909.798559-1-csokas.bence@prolan.hu>
References: <20250114095909.798559-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v2] ASoC: sun4i-codec: Use new devm clk and reset APIs
Message-Id: <173687253259.61795.6623030930207706042.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 16:35:32 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 14 Jan 2025 10:59:07 +0100, Bence Csókás wrote:
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun4i-codec: Use new devm clk and reset APIs
      commit: 65880d32e1d7eb1ef03253c454fcd8f9d41aaa09

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

