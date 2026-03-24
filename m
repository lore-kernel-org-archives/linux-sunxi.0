Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422361684BE;
	Tue, 24 Mar 2026 03:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321725; cv=none; b=Us/xy5DvjXru3925s2yC+sEsG9r4/mpcn7F9wye8t41ScpMxbFbutQj/iXvzK9uBQtMOqVuJu0AKR8ixk5kd+0vv9anVYZwvZGF9kkc6ghzBffjjotL7UtHW2A4mzAfYMVlvC0PjZwYVyWgR6GiLWsIVdL9IQH91e34O4LQrLHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321725; c=relaxed/simple;
	bh=L6bdm1UAcNyRmk3Mc5xmi0ANiavnrf9n3FslWt3Q2V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hTemAnGJg2ZA+XTbtCcnTSrP1lU4SaEwhHCr1czKTKz6uPMXeod55YARi1e+J9Lc+akAeDBNWbsudywniMt+YnfFCAS5R+mV6J+qKvSWNCrpbQ+7WCfX9W9xwSorpxyHvGWKm80ECVoVU8lK/Q4nHmeENelJe6jB95fZNLBYbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHF3aDiV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHF3aDiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83954C4CEF7;
	Tue, 24 Mar 2026 03:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321724;
	bh=L6bdm1UAcNyRmk3Mc5xmi0ANiavnrf9n3FslWt3Q2V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LHF3aDiVHXC9i/nGJ35BLo1UOhtq97jikR0glYnrWss/+pr2g40JoNyZuFhWYQt3R
	 7SKZJY6TQxfnqoXDWCygTMJtcaKbbt+h4y6OnNdUFmK1ewGTf9/QEBX0QfCXzYJDdY
	 VOlw/rYSRUgVuA4sV6kDoqxIF4szGJE2h9dwGMunbX44cvG0XMME8VsH+bzTwEB4Yx
	 aTtYoBOnKL2+dznMugbQE07SPUgoPaPcwSClyl99RuelalvVBcmmG08iroRDz69xZ5
	 HMF75t+N1OQDgHWDZe8CluOzczvZuedXdIb0wE5rt4bcT7pEHbzSGH1TBFXYhnUORw
	 +c9oedL99psnQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260323171927.1256507-1-wens@kernel.org>
References: <20260323171927.1256507-1-wens@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: sun55i: Fix r-spi DMA
Message-Id: <177432172322.21043.12372539373263161573.b4-ty@kernel.org>
Date: Tue, 24 Mar 2026 11:08:43 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 24 Mar 2026 01:19:26 +0800, Chen-Yu Tsai wrote:
> r-spi has DRQs for both the main and MCU DMA controllers on the A523 SoC
> family, however it seems it that it is mainly routed to the MCU DMA
> controller, with no obvious way to change it.
> 
> Change the DMA channels of r-spi to the MCU so that it works properly.
> 
> 
> [...]

Applied to sunxi/fixes-for-7.0 in local tree, thanks!

[1/1] arm64: dts: allwinner: sun55i: Fix r-spi DMA
      commit: 6896ca5a9d05275fbeb38640c9bbdb95698de188

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

