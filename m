Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717274;
	b=f8aWNefSYSqaamQVUqvCrQbY8+vjU96q73LUahyAJ4yVLIS4Wcm9pFqPHxdXHB8Jlngn
	 Jtzev8YcL1aLU/02mk6o06TsIMY492n7kgsHYShsY6Q72nEMqchimlwMp5SAyFej7vbeK
	 URbZnrkxWGIHlE5zbnVwNJl6Ob3/QtovdKj3QSJ4cLVUr78s+VRdhDgi1PJJ15ExZUHTA
	 94Z2kXpY7OKzA3z0gDg9ce8h31yHXTSwfn55gQpzaWOvoQ9puGyEVOAXbyq498ba/W5Jc
	 nC8BPMG3dtJwkrz1Hz6erq8g9lPUmhCtF2C/jhqSy78JCMMeH9M9Ol/yRuGbkFF7MnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
	b=qRT8OdFKqMfqHJgSgWV8inC5WKhJawXl4EJ+8LZeiQ5qSMECD8F1s38eA+fpqZXvnDyM
	 Y0YAU27vhWC+4uCEs9OJmbbxISWnP0HS039rVZaT4zbKLX0YgPme/L0saWOJUhK7uXBsn
	 G/wwB+LjTzbP7/Z74YfE2gE88FEEtgxohaLAqVHkhEo68H8vs8dwBpLKCneraZ2oBTxpu
	 bovQLamiOqYyA/ewIL9E9KWAE5df36LonQNnRO1DCM5StuWWDalZflGJCbPBenSilwO4g
	 bimmrKOkHIYeWOs/wJN83yjwpAXDUL4z5SIXpChaEAJ0n3/uOtU7wYgxLD4O7dF58Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0qF7PQ+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E426083615
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 14:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E426083615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0qF7PQ+
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-679a2297c55so4542912d50.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 06:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717273; cv=none;
        d=google.com; s=arc-20260327;
        b=e/meGSuwNWCZ3D5svEVGateWRKvzrOnpj3NQuk79CHqrQUMSFc57zjNiTIzPzPJQmb
         ekwItjXtkvaYfvWLlZBLgUjt2AQPA2ot6VJd6e1C2surslFkq8Nl+9tVu3Epnko/zcPM
         Y/9m1HpevlAU9JEOxfmeY+S/gTP9QGBmW3aJ6YMGlBfqJXk4EfcQrudx213lnySUf6Rz
         DpHjwrGxa2d/p81+o++JRo0C0Q/twJHbrM4wBCuy0yAM4bqw4EG6grhe5DsyloS3FCFs
         hb97SxPDUwl7zokZy02O97XjOH3vWBXjgzlOIIZcCvDf8KGn1hE19b3JUyt23eQ1GOwi
         hUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        fh=NuI/0NBz2HWlEwp6tTPKU410hE2uPzGSuF4YLIg6YFs=;
        b=K2speqOB0lp+dMTO5K7tfILpeY7Ke9oSJvvu++w0vsxHnhZqlB3RWdTXF1XbCL1vHP
         IyXvmdL2PomUZwTzSbxzJHl2waoY3efLUFmk1gVrnGfs9MVwRmAeCde5c+mw9yhrwv1B
         0Uw7zUKvGtoMs5UzXLplF/11DQOx7GGo8T5bkxyxqmh7q58IVdLGfrrBYjlKrSG6p24l
         vnU0jtdpCO+r3iIB1AAo2kiKl/a5cQq+GxmLOME5uxne2ZhW5khi/ZdCZEqdZHoFDTZX
         X/VlUNWwhOSNOM5UL2/0RWt8tptmJuRAeYUqVlBTkCGaeN8qV1yucmOCGuB3X+5VegMF
         /mog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717273; x=1794322073; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=o0qF7PQ+HOo+LiZhHq3Ygpw0QRCRYUN/bay6KQMj17uMTbAz5eGCBIjvv2xODDZwr3
         ysfv7n6IJPplGWIe3JwOFfN2Dls/AHTjohjhj2z7/Zs+mVb9JNzKKwTvJEZtzNW1jkP2
         Nzast07Ryb3kmunHx4iR++8zoybQZZjkd3PakY0ejFjM1w9pPwoRT2i4DgZgVCIMedzw
         y553zXdTDPRfi1mdQT9QcpzoUyVwzt6EwyuDwkiaIPrILuR3npmtKK6ANM6Q6f6/YEpO
         LmeWGwktyyfMXK25rMcrHRbPIzTGKq2VCzb6y7WREk39XqDwQb+pAsnSCpvHpZ+Ftz6Z
         4Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717273; x=1794322073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=auNihAxcgMiWLPVScGclhW+wCzd6ZkZ5EJYtfjJeiJnNl5n9XhUg3MlIhacuHdOtZj
         QdkVMZDC7hv8CK6Ssw+LgTMWpNQphTZIheQBNDFkzLBjmNAj/7Vcrp9BWt3fTb5I2iV4
         tlYQbIamCaJpbHpSAQ1wsF8qnyE62mlE6KZDWsidHPETkq1SJY04pE7BvUKXlrt4uk0x
         cj8cPYJx5iNVFdqH1BO1gZaQrTi3A12wbFMd6rvEAf6nWDECgjrFmAopPKhMtSsh3sdp
         +KWye+jlTk0YV4h8suUuM4FLyRNKh/1KqyafG7Vp+N6o44WxRAJwIUjdxMxNff6i4jZk
         /bVA==
X-Forwarded-Encrypted: i=1; AKwUvByZmM9zSw1fXrSqKyIUTGPDQ49Ofcmx5Ah31WaTi/pYqXlncd+b+D8mFwBNsE8JN4F84BUAa2nxMk+Kuw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VWHL4AmHJqe1yR/6ALz8JMWDTTxxP1nm1EFowTskDKlbW542q
	jvZVZYjPBV0wymcYJrLGXWuGGL5h9ArQCNB2a3e0PMipORcxNj6lbqEmBvLJ9k/IyiHsgXMqNu4
	MK6BLfQyV9TbiZZTRZWqSSJ9bWK6vHg==
X-Gm-Gg: AYBFou1IO3tXvpAD5nEdOpRs4wThKWRuJYPHdAy3gc+ps5vg+DeeY3dpE6OIfjcA89u
	OHPY52uxx6Hij3KodJyL6609rH4il35Q3JdA0dv1C8xTp6Aw9I1K7j9sNtqq/L2mqvR/Wlz3WM3
	G+oZtgFGEEtTmod+Tf7Ph3gJqUbVU1HFigs3B7QUKZpelNuyKT/mzEKmh0yNgoLz+IBi6jrqWpE
	QftgJASNuHu+S87GSYtuB9xf0CzWWYigZMS9EN4xYAmd68O2g2JqtTnAORzBvSg/2kCDByBShw2
	mQgXhyEw3MPE/NzBWe2SoZXkFlfLbI13qcsm+qQq2Dvj2poav3FBIJ6fBj7pREVJ2UMhAv7I1J4
	CAF0QwTwuLuGYtVlSVxZKr2iQ3Fvl9D1CtnwWcxb8o7Xu5oRjuqVq7H7Aj25AwmTHDOcVn+3rmO
	Mcx6QUQ7Ss0aarVOE=
X-Received: by 2002:a05:690e:4088:b0:67b:e1cc:ca6c with SMTP id
 956f58d0204a3-67be1cccb74mr681732d50.47.1793717272964; Tue, 03 Nov 2026
 06:47:52 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com> <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
In-Reply-To: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:47:40 -0600
X-Gm-Features: AclHuK_bAiiHjTrLk6BAhfSIpWQ6uON5mPRZGYY15ZS0axcuvmvGLmO8IscHRKY
Message-ID: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> Does the downstream BSP have this? It would be nice if we could port
> it over. Then you can properly use the power allocator and/or the
> schedutil governor.

Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient = <190>
on cpu0, and sustainable-power = <1200> on the CPU thermal zone.

The energy model uses the OPP voltages, and Andre points out that the
current OPPs are A100-only and don't fit the A133. So I'd like to fix
the OPPs first, and then add the coefficient as a follow-up, tested with
the power allocator on the K5C. Is that okay with you?

Thanks,
Rajan
