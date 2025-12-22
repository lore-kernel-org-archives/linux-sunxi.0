Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013F23AB98;
	Mon, 22 Dec 2025 22:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441564; cv=none; b=LeiaPBybpWoz83aMLHS35adouwDFUfO77bp6NED3vK1WnBsPNQn9EjX3CKT5rqVcqCNTHg63t+xFVhz8tbNb6cpzTtKxkSXK3TACxgsDYUXFc7tTJsjqZqScF1gs6OvXg9QFyGavGLiNY1eG5S/mfeObyUrxb2NuR5RLFxTdhsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441564; c=relaxed/simple;
	bh=1r7h0p7ofkj/BfHkzN7bGtcjE/zZ8wu11lyGgKO3f28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OU4pKuqcXEkHByqQG+5RogMnGxSFWINBu26bro4AUT/Zj7+80YhiUQeh7lJKwngvF4d1u3LMSwOi+wAaNtnzW5NgNXZrTmM7ik/8g4X39X3f22DEzf8Bm1DnaW4AZJ+XyVZYs4Kr6ScN9eqLCXgMYlB6z+z7LX37fWL8OxO9fLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBvsORVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBvsORVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39E1C4CEF1;
	Mon, 22 Dec 2025 22:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766441564;
	bh=1r7h0p7ofkj/BfHkzN7bGtcjE/zZ8wu11lyGgKO3f28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uBvsORVawtXBxCxdeWb3yw0tUFFUu+rcrQlIGlqoX8a/KBlxek5SpAgRW2ZSRRUSc
	 VhNjjdqFNE7GJvhwWwBWK0oMlGNlHYcRcLglD2oNHw/TjIdgCe1K6mI5HHirSutHkw
	 rE5VRU4N84Re5KyRReTPofUZIXGCqPUX0JtAONIjxPf3bOt6VOqyLa0BZ/gsHenfnT
	 8Pxvql1gblLe5XqoWVJBOHHEOl1Rwrl2egRoudb1M8dYANiFdofrN1MBy6IwaGkBiK
	 MTF9TO2Mdgybww3GCEPeURxmDo3/8Tu4I/8Cqf17fUnXAODJxjLGcU5NVmNNFTywSk
	 B+wb3++0g+Pyg==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20251221035715.1722584-1-wens@kernel.org>
References: <20251221035715.1722584-1-wens@kernel.org>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Add missing kerneldoc fields for
 sun4i_spdif_quirks
Message-Id: <176644156265.2187098.7267492024920127346.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 22:12:42 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sun, 21 Dec 2025 11:57:13 +0800, Chen-Yu Tsai wrote:
> When sun4i_spdif_quirks was recently expanded, the kerneldoc covering
> the structure was not expanded to match. This ends up causing a warning
> when the documents are built.
> 
> Add the missing fields.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun4i-spdif: Add missing kerneldoc fields for sun4i_spdif_quirks
      commit: 6c11aa2b4cf767f5ccfe290b2572d53102dbe5ea

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

