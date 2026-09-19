Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA92C15A0
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Sep 2026 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803914; cv=none; b=DJpjqQYfC0KtxHMHoO85o7CG3H2tN1WP1KD57kWJOWeNlRNd+ykUNfY2u0CyBWBhseu+LKSpfwekw4/QUgTzGRxttXbh+jU/sikC5Msm18ShbodR9N5vmfeKFhpzEJRdETExs2sbk9WYerL5RFwJqswAbOuG++7gUVvYImKFXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803914; c=relaxed/simple;
	bh=Q+zCiKser7bCWIbP78SoG0/m+GiWQMGnDLfmB3/UOP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNIMMpL6mCPCroGeA7q4JUKdSUDvhNWuGKjyL8jwlzrfQYePOJTdLGuoehluTlKM6vWTJcLKznxEBFUhaUzpjQTW7Zj2qq9tUwSKkHpi3Vs1h53u46fiuJiYMMlizIoBWDSuYIdEdmfxNwW4g+7K1SFsnZEg0zmhGyPCsz4R9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1dVkjk3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1dVkjk3"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso12753045ad.2
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Sep 2026 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789803913; x=1790408713; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=E1dVkjk3zH4I3g60L+Ux/DEwMJeTKfmpfG6IL8LAKG994gY5VRCKzISbQgLrYcu81r
         j43Vs7MPnWVb7GWiOpI+72skqXrZyHS0yXLVF3aGChAuJxKVWXBNdYXXts3ADJhOKLIe
         aKIlwk4ufo983hWOd2puRUxH8O18Y3tUeoeCLnDchU/BdCD0VQBn1q2NXmNDexQJPyA4
         UfHzzuw7a/KP1B4qlM18nIGMT3K+hPNp0+azjDA65XMtMhxxWI6gkQlSwS6ByUhJExcT
         syhP/i4JWDlJVRkSWmwLv0DFdzgh1Oj89kSUa4C0zI67TxKkzrqGVsr1ZX0KdHB3ZQAo
         7gUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789803913; x=1790408713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=ZVunuUAwGndAiH+VEuSt8T/tEGO0x/bhCLuM6henQsCUvP2Ukfg3cP24ozo9a9fGvd
         CIKsk8F2nloDIjRipLmudAySiup6Pq2iW8OS67dBdrrTBk7OeoK0TbKW54GYCqtF+bnx
         k5zLu7Xbyj08+8madLDOBqo4MbqLRZU1Mf59g6AEMdTI0UBtbY42p8NJkBdsaVFuswf+
         un57QcAfInN37V9gqh1NP/yMd02EFsvE673iKKoSFy/Sc7wE0S/MxghJfs+4OhEJKt91
         soB0GuTGDU+aUMQG0nlLLDhCo5ArozC/nO3HlmFFvL1YIqiKdeBUZeZz/BTmSMq2tbDH
         Dl7w==
X-Forwarded-Encrypted: i=1; AKwUvBx43vL4808NhSctrMghza+441wQmYvGAlqi8x2IMA4P/D6gDFCEtbYwTLzBy4bCmd/hPnlX/j9mUio+sg==@lists.linux.dev
X-Gm-Message-State: AFuF++lANZQLY82D6fZny/QUAYSzcc+zF/zoK9YZtYgyEOjmvjidUl2e
	rfnzXgpPLjq66X5DMDOheb3ofA4FrcfZoptxOfeCGQP04KqS6F0r29CT
X-Gm-Gg: AYBFou0ocEZIpVoOEgedY6Fem/Bjn/Hi+mAA+t7LoLg8BDFL6KjGnvTXxCJVA19hrI5
	Ng4aHPNy3GgSUn0KKjZnELpsfa+XxdTK8Un4wNrFAcrhdNoOALcXjqCv3oZwYExEAfRuytRdlTy
	EGruJNOqXNP6/UgWxb2CIrmsuL7UINP2NLoUMn8KOWN8f/DMOg6LJBi4x5IP2wcQ7ouHaN18eP0
	zT/ct8c44KzqQ3ahm/YPEnHQxDZyDO9t4/PQJAUJGhJFsgKExNuyRBpzJNhW4aFC5yKj5y5J4wZ
	Yur4m3AoHpMnYIWRNQ1MTpHgCBaB64MxpcAKlYtal4wNRW+yK+oxAXVaqJLUHP7f8l6xEuAZ9SG
	lhFTL15LolMpxzPJ3ZPtrcvgSUth8OEtwcJxyoQagN3jAfmkGHYUrH9etDpqbWh5J9w7T5776Ka
	90lZZb3fRqT21ykW1ogFr7wQm4SG/WmKD13naZCVKRzOBvSxXnkDEKB0ZizLmdN0hfHu39CmS9S
	Q==
X-Received: by 2002:a17:90a:c88d:b0:39e:4c80:f67f with SMTP id 98e67ed59e1d1-39e54f3aa58mr9006171a91.30.1789803912686;
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Received: from [192.168.101.188] ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm6860122c88.15.2026.09.19.00.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Message-ID: <aeb5b8a8-e01e-404f-9788-b4770ecdd9ef@gmail.com>
Date: Sat, 19 Sep 2026 15:44:54 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: allwinner: a523: add DWC3 USB3.0 node
To: Per Larsson <per@palvencia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20250816084700.569524-1-iuncuim@gmail.com>
 <20250816084700.569524-7-iuncuim@gmail.com> <20260915013336.68ee3611@rpi>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20260915013336.68ee3611@rpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 07:33, Per Larsson wrote:
> On Sat, 16 Aug 2025 16:46:59 +0800
> iuncuim <iuncuim@gmail.com> wrote:
> 
>> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> 
> (Sorry for the more-or-less necroposting)
> 
> This is the only mention of irq or interrupt in the entire series,
> which at first led me to believe there was something missing given that
> there's a "Nobody cared" message appearing when the port first detects
> something connected to it followed by something about the irq
> being disabled.
> 
> Now I read in the text of another patch (adding a TrimUi dts) that this
> message comes when an interrupt storm is detected, and given that the
> value in /proc/interrupts goes from zero to 100K in no time, that seems
> likely to be the case here as well.
> 
Yes.> What is this interrupt supposed to be about, and can it be handled
> better?
This inerrupt should be disabled in host mode, I'll do it in v2.
But except this message it doesn't affect functionality.
