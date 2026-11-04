Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793764322;
	b=V3vtNstfAT8rDWH6tlluyOBvCcagl1HNjnBAywAjFfRvIQMH1Obw7IpDDDTEPGTsHAsD
	 lwCEadzwlM+b2l78Kih4ezgmKqSNFrixeGM/f8ndXBoz3jemmwuIEAQft4nS9tFHfV05h
	 0THV9/VrQIn9gfFNkAjCs+2a6d4Y0noNwEaVUaEoKbblyj/f9o1vvW5AWGer0Htl7fdA4
	 pW+pPM9afrBBuQTj2NWOfrXGS/cng92FjiacqypNsYco7jELzqDjWe4jCjf8IibEgQrgs
	 lG7+8zb4GxHGIk3g8RPVayS8Utxo6fJ929zZcy7R71pE01YLUYUnAaDLALgKJwodXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764322;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=1etMSI00u4HSF77ZkDUFJOJI3+oHrW/cfMlWm+E9CKE=;
	b=K8i52TK8UJ+lWTM4CZbHvQP537kIB5+51iLeW9QdW83rMiri9op5w6/3QtqIHLcpiGEn
	 OH/K6no3WL+Txuz1APwXKPWASwqtcIzlZBEVMtbTULJ/joVg9QJngGDY8G0Wqdf482As7
	 mpLtx3SEFR+bV2UfGPgMDhSXVAJaBiEUHP4GNJb0Z+NJxEJ/3G/9PoCW+nkYdEVcqYeFr
	 EZdOsfifZ29Ci36OZsj8pXPqwbgeuiixWkF0W2FV8ZzPM1FlJJhpQafC/WA+CDdltn2vs
	 l3TsGwX8X6puSziLD0Gwj99cpankObU1QWmhbPOUQvbo/lZKBdlGDfxziJaVJfs44rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLqJU0U6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDABB606A31B;
	Wed,  4 Nov 2026 03:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLqJU0U6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8791F000C1;
	Wed,  4 Nov 2026 03:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793764321;
	bh=1etMSI00u4HSF77ZkDUFJOJI3+oHrW/cfMlWm+E9CKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QLqJU0U6pjLOfwlMdr6nKyJF31ICq98jK2ebIvNy+gHkszwNR52f4xJbwo3piEhY1
	 yoDhf/Raa867XWmMh16vuCbuvPAJRldwdpvpWz2QNlEmWd5Uzyu3Hg8y7JRsFzW0KK
	 h8MV4mM8V37D0TZbLjvL45CvRZu6jfZzCeLRnr7PpMAcBt12ukLvIjlJcnWjzFGRf1
	 RcaGKu0fYDU5ywB4gSIyCcGFwF7v257dMKV8e+6Dcptu82a3LQskQWbyRN8Kc67Sfu
	 XqNg5Of86xE21mMiqBRYTxS3Urcb2xV+KbKJdHSmOCLtYoZpx+Xl48aOcFC7OSGORO
	 3tOFASm40IHjQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261102233348.23117-1-andre.przywara@arm.com>
References: <20261102233348.23117-1-andre.przywara@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a133: add ethernet aliases
Message-Id: <179376431988.76113.3054879706039363270.b4-ty@kernel.org>
Date: Wed, 04 Nov 2026 11:51:59 +0800
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 03 Nov 2026 00:33:48 +0100, Andre Przywara wrote:
> When adding the DT nodes and properties for the A133 Eternet support,
> we missed the ethernet0 alias, which is required by U-Boot to generate a
> stable, device-specific Ethernet address.
> 
> Add the alias, to allow U-Boot using the Ethernet port, and also provide
> a non-random MAC address to the kernel.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a133: add ethernet aliases
      https://git.kernel.org/sunxi/linux/c/1cfd4392ab15

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

