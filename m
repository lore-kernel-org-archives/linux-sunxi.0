Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D743375F69;
	Sun, 29 Mar 2026 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774790571; cv=none; b=Wm+VqIncQNhzxT0KODmgL4oF2BUwAeZ5ps0a6nEL3kB7YZ2sibrNBRIcmTwNf8qp3EN0arGrMSEmhP2rzJeQkSw6+QZKNpD6E+AUJ469/vFPpCn2Dfd3BgMepn596QcX43iH2hpQ+FWbbGZknPFdadG4hySLTWcycYNvjNnPwTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774790571; c=relaxed/simple;
	bh=ovSEObgeRsjslMxSegbqTaXP9AY03Bd+E9w45gtnMZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MauVttKLOHENNNacsaftwYy3v22d3cor3NuFsUazVt17Z5opPM0i6dDRlnKl8N0FgFEDXPD7LF2wqjYPHkLa1sDrn7IBISAIjkRse+lX2Uf0vPuEqorFewcNX+udZpAQT+cVUKmYNsmDZdL0NtrBSUT15BbQohsWbmo6EMUSt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ch0n749c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ch0n749c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BE7C19423;
	Sun, 29 Mar 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774790571;
	bh=ovSEObgeRsjslMxSegbqTaXP9AY03Bd+E9w45gtnMZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ch0n749c2exxPRXJhPWOg9Y2Aq5QzOirVWOjSpDk7/qFt/zla8VNq0oNEySTgE7la
	 tkMW/LaZ5uZ6SO7tAs0MeevDvCRcWmFLdza0BFTRxrMgpRFXeJWoqpiSye1eH06uQn
	 /JgCyXb5cwuyHoEzhg+aOFVFarTg8p+bXGTJpOEDeRfDje54m+0dSse4CY/Uox4lI9
	 Rvy3R9+KQjZlEUPm3vxFkmH1D5s53M23fWoDzsj2QCJvom75FjvYlhPorLdFN1qThD
	 ZmPgrgRk+PK3hilQCDVfCMBZKJZWXYb4a+AJ6VhMFOCMxKUUP4d6G6bh56ttnQXAfd
	 +YKcnKGqvFhow==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Message-Id: <177479056948.84952.5705441423668653540.b4-ty@kernel.org>
Date: Sun, 29 Mar 2026 21:22:49 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 29 Mar 2026 13:43:04 +0200, Michal Piekos wrote:
> Add support for timer by reusing existing sun4i timer driver.
> 
> H616 timer is compatible with earlier sunxi timer variants and provides
> both clocksource and clockevent functionality. It runs from 24 MHz
> oscillator. It can serve as broadcast clockevent for wake up from idle
> states.
> 
> [...]

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/1] arm64: dts: allwinner: enable h616 timer support
      commit: c755e39836ec492b0bc210fd96c2b720b5b4a690

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

