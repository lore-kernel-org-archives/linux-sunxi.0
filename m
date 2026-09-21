Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991ED4B7A24;
	Mon, 21 Sep 2026 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006359; cv=none; b=Wi1dtay/ZKoXDePpjj4IcLy/BAOFevICK/BJWIMgmB3OPp7i5Cu2zzs2G0HV2C1913uOEARus5UP5PLm6OH25vUG/R82U4sBZ4vDERMa0kzYTtsPjN6P0/3hqfCXEykQJxwrj5Iru0G4VwfcQF+sCUVkNGl0Ps/u/d0vedibahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006359; c=relaxed/simple;
	bh=3zwyBDzDw/sDRKsb2dkuITkZ5oxgVhergZq9/1pBPDs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pBZRq3z/1RkqWgYGJhovQ6fKed19B82QRE5XhCcOMRG7HKoHJKCvyo8vY8MUCKZAyWfwe4jBqJlBFoCXLRj1zmNR/rilEtVcmMAAJwHHqsU3ypuWRBIkwoQCenvzxueirW+eEnlfbdPVou8fxfmCZd4Onr12ZY8uyLKp519BnPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMW1VHxx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMW1VHxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4D01F000FF;
	Mon, 21 Sep 2026 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006358;
	bh=klzxBRfFaH2Orv00iYSc6JCYl253Y4N1ldcNWsa5AeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JMW1VHxxbBR3oKgf5kY02ig/704uboevycy7KXHZVfPZrEIypMza35U66lQKFA39z
	 kZMjxZ1BE0PTrGXD8NI8kZyr2AT/h1U1n62si08YgQMRlfzQzswPdn3MPQ5t7Bv22x
	 wNw4ct0tYxKLxq12AD1iIXDh3N+T9yIYT1k9euye2JQDq7VY4d+gT5WULumwBwQlG8
	 ZJKvo3xx1AFvpDtduJ1CPHtrrSZHoyNCU6k4zSwjGVs+OAsC5pDQ9nGGs2mWOnxaJC
	 bc+zinY3TaWdKSyDi1GEfMAwVw5Hd1OOARigdX2easKgT/u+5PKO3e5N1MJyHVeIXV
	 unmwAYQpnOnqQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
Subject: Re: [PATCH 0/3] dts: allwinner: Add Teclast P80 tablet support
Message-Id: <179000635627.4032064.5273125584221459369.b4-ty@kernel.org>
Date: Mon, 21 Sep 2026 23:59:16 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 14 Sep 2026 23:01:12 +0200, Andre Przywara wrote:
> The Teclast P80 tablet is an entry-level tablet with an 8inch screen
> and an Allwinner A133 quad-A53 SoC. There are other tablets using
> the P80 name, this here is about the "G4" version from 2020.
> 
> Contains the typical triad of DT support patches: vendor prefix, machine
> compatible binding, board .dts file.
> 
> [...]

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[1/3] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
      https://git.kernel.org/sunxi/linux/c/cb81a22504f4
[2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
      https://git.kernel.org/sunxi/linux/c/87d5ec9b808f
[3/3] arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet
      https://git.kernel.org/sunxi/linux/c/60b064eb82e6

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

