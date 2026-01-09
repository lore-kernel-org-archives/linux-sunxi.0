Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B312882A9;
	Fri,  9 Jan 2026 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973235; cv=none; b=j99j9sR3m3QL/4+1pRGOyC2B15LCZFgro718ltLVYGMEsYi49H8anLjV/vJaLMe4fmzrOAcGYz1FFUhdO09tVm95pvjNC7PHOLOE4VDhb3tX+SUPr97V1f7izIIdkJMIT5L0GR9tOiIrDBrPuaP8d8V7OwoFU0BM+r0SmN/ZJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973235; c=relaxed/simple;
	bh=8/gkUfwwZJrRj+SPpQSaq8Ay11oEHSxAGRxo9DBOD84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ophs9nexDa6A7B7+xVZr0o8d5lPSYfEvXXdIE63GHRTrgI071fmT2BMzt7yxlxVZTyenNM6mUHvy12qbsFA6IUcn9Tlk+qYNl+gPZxODVr0EMiN9+jDepufxU8C90NhAxaZX+K2TeTcvVyX5q3UswlUIy2bIMWkt7+M8bUHE+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFlJgdk3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFlJgdk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E34C4CEF1;
	Fri,  9 Jan 2026 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767973235;
	bh=8/gkUfwwZJrRj+SPpQSaq8Ay11oEHSxAGRxo9DBOD84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oFlJgdk3ibMMND4ievPiDy6aEkBo3xB4ICejo7/pX83THYsD0K54kUILmc/SDss0q
	 K11mkJ8+BHAiOfL8gEYY5DHgkvsWmUVi21/Y/5xdY07xlacXKqWHfFglPt3RCz02vK
	 OEvJdbjIk4ZtJIF/U2pYFXNzXTquprGY8KHOt2f37f9rs2a8sY1vFSir51a7WBePc2
	 p1U+mEQuDCesU9LsFMZmpGT1uyHFBPfKT0Cx3FZ4KVwyyiXUxO6nZens8GGsGxxUq6
	 jihTZCS7cojDpv7C//a6B71WzST6IzTvUknbrLUMNj6qXdfyoKw/xOc2TKKqEuHdQi
	 SDYW80vnBHF5w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251225080241.3153453-1-wens@kernel.org>
References: <20251225080241.3153453-1-wens@kernel.org>
Subject: Re: (subset) [PATCH] mfd: axp20x: AXP717: Add type-C CC registers
Message-Id: <176797323317.1819213.6217143202199150737.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 15:40:33 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 25 Dec 2025 16:02:40 +0800, Chen-Yu Tsai wrote:
> The AXP717 has some extra registers related to type-C CC pin
> negotiation. They were missing from the original submission.
> 
> Add them for completeness.
> 
> 

Applied, thanks!

[1/1] mfd: axp20x: AXP717: Add type-C CC registers
      commit: 7a4c13c592225cd6728ec33056bb8252ddef1617

--
Lee Jones [李琼斯]

