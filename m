Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779223;
	b=leIcx6G/5ScD43SIx5p+gT6rzC/tfSkKwpKR6uj9MpAJz/HOJrVB8SIUNFTAqSilF2GI
	 ccv9wUUBNfgjB2dXbcBg7GbwZ4dUSLNBqiGm0Hi3ZerHydpfT4WihfXDz0DYjqCWG0afZ
	 Wb8bRc35FyGVxxLEZCutdv0xSlgQ2AHgNhZBOCIuLBCqCFzGdz+jW1+1jpco+pZ0+uFuv
	 8+nZOuOmC+jZPh5YDuKMkjf3QD3B4PjCvLhhRSbSiGcm2XFICJqthz9S9/hiwPgpXsekx
	 bOhgsg/M9QzWW4r2s1blQ+m/g7mDISedmpln232ZoGFU/zATaYoIGklqhEFQ29LwgGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
	b=beo7Z4mdzuqetqMQ2HI60+xX4fkd0/3AqcnH1Mye2+U3A2/3F6WX00faAnjLVouQcCeE
	 yV9Vg3+QQGRSpWLiN3Pu9yu40ox9/4TuwPA6JKUQhH9Fx+VBA5w3te2IaoB1eob6xp9ow
	 lva6eEFfXJ3V0Kddk8krUXdN9/SN/hysmZPuEWgzRNgfSOTiQi0nmnIgvwitAHxfqzNzc
	 QDUfFsBK45GZpWsUH0zQOku81GIOKNQLnUTnoGQxUD9xf6lEPb12Fw0gs0dEvwst1RJdc
	 vAaIGcmUDzEB2m1I1hiH8pt9skxrfEU/NgqR4awoKofhhyxbr0e7j6qPVav1K4iF30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kr6gOS+7;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BBB606A31F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 11:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BBB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kr6gOS+7
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c516a192844so856766866b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795779221; x=1796384021; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=Kr6gOS+7YZP+ffMIuupCDbPr27rSB8w+Z3BIllm6aDo6T7vtgGOfkZBL1ARvTv0473
         GOEZJsLFBCVResfiJuZZUzCRV+/kf0UfImt/aeJj+nSu1ASaGfxVuktcwUEZ8ZB+7noQ
         LUk2fHZFc71zOyBNHg1G/MWIt5mjo0W9ub/R4I+1V/+wz+amNtzkzh/Inls50DM6CXWa
         XN/kqeTaMfwLJI5uvr/7sfb4TVjC9WJHQuk/60+N8yRjmOqC7qq37qZIvVKpE2uLekwP
         ZCU5wbfdrVHG21w4rL6kucch0F67+XqQqFgsun0HTdZgAAHzvwM9FkrG9UcXTUKHD4Dc
         4aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779221; x=1796384021;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=OT4bp4PcMzD5rsNJ3pVVA08+UmHiLUU2vs0imCg6U+ekAq23MF3XZaQNGQFWTMvyvq
         43tILc8dm/CQrF2m34L2e6onsCO51nT04cnMf3gqwGAQxq+oVFhWYrWKVSDNsNhfhYLe
         p57xaB5s6wDPNMoqCN3oosG29DBuriKnuyk03Pv7N6VVzwXpa+n5pVhL6N/RtEaJW4Bc
         r81Wjcn89p+49NwPtqXSza9bA4AUL8v9FwHNhgyMXgNb+jWI14HRkXUEh4V07TDtTart
         +ebqd1ewWa376xtl8zirMQ519JViSkiBRt/m0iqtkXNVIQ/ZqoW1ZzSaYalJ0wbGhtSE
         xHyQ==
X-Forwarded-Encrypted: i=1; AL+hErEJfw9uK2002MlamqddY4n+iP2Oaq4YIBoWvSZIZZTSr5eh2HJhyU/T2ZcvQAz4crGBIIv/N2V/h8wMIw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5ds7CAeqtn452uN9D+WuzBTfVd/51LUgxi99o0R3SrJLYrq68
	2oYo1uh9alqc38lVdWGzq8zh+T+Ixn6fIi+OSwlpkL1cvJHNVfhca3QS3aTvYJibf+Y=
X-Gm-Gg: AZFdTZejQ97Pnm36gNA/PXzLgIS+fa+uBFZLMOqTqqt3sP4isTKFaJ6EQ2cZVyO6piF
	fj/ch5SzBUa57IHH3fWezDn+n9rwTZ2v+PRuqDlfBHJwdfp/y6olMKdE2KepAu7KQeXHdlD43Cr
	4v0J2JM66vQMfb0CZv543aOD5KYcpsuYKcglxEuOqKesNxbrjtLnD27YDqG4/lQwGZMhgDO76MP
	T9dZiUW3vRCL+x2Pe71rDAxqcvX4uCIxO2AAUrALbzLe5ppdltljn7/Vf5j9BTQr2OnOkMNQaEx
	ce90KrH0VpvhAY4+rhbDwFJ7UK9aX0lmU0JU5b/eS5V0jmsp0KjRejkAYRzhn6zNYow3/CnMWqI
	c3LRbdtb+aOth51ZXJxuB9pvRpW2mJIc05FPpTF3xnKjVLXLR5CKJAPf070961BVD3KRFmUPq+h
	qXyyjf7qKNmdWKKTbFnRcuyYgqpaKWwd+dTw2S+CcaUucIoeMjwXZDNcr9P/kc18yW150B5gAYc
	00AYwew1fQ1rd51XxesAKC1Ej1TAY4A5r8Lhi52EQ5UePiNEAHnhDk0l02UcEG9qEnYtXpLYbGJ
	Xtw5hjnJoxoqdSbkGSfN7DzZs7q36fm5L09yzK2sZlGYFqvykWPwL/kPZbIFrKq3R8vVkw==
X-Received: by 2002:a17:907:8e88:b0:c40:80eb:c543 with SMTP id a640c23a62f3a-c513a4347famr2083302266b.4.1795779221611;
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm830289666b.82.2026.11.27.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>, andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
Date: Fri, 27 Nov 2026 12:33:40 +0100
Message-ID: <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 26 nov. 2026 at 15:36, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> +
> +&pio {
> +	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pc-supply = <&reg_cldo5>;
> +	vcc-pd-supply = <&reg_swout1>;
> +	vcc-pe-supply = <&reg_bldo1>;
> +	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pj-supply = <&reg_swout1>;
> +	vcc-pk-supply = <&reg_aldo1>;

K is bldo1 according to the schematics

> +};
> +
> +&r_i2c0 {

-- 
Jerome
