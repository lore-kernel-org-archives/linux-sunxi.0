Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D39512294
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:01:17 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 21so18888964edv.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75rd0nxoknxf0qfQbRb/8Y9yf4jaHg7t68qk6D5sD+0=;
        b=No3yWU+ZvUWANbDZ+qjs/d41PUWLkEp3ZQntEBUKqTP9nEE6l7iPGQIpcKobc7rXHn
         de2ajss8UoYWFGc3vNShutT1wi2TOkRQ4ctRlkw8WQJ3/gd/AJ8rN0F3XIK6QtK4ZGUf
         5Cayx1tSCGnsQrzFxwKGcH9OqLJVf5DtcDPX76MVmhGAZJBbTdK80c/OyeE6FzFKPWMv
         ZbvvJtIMz3KH647cTvs70qQTddp4zWU4TAhvcg7382Fj2VnlUn4zSDer4hB2yvI9lFN6
         lGBFwi+DMAotesVVNwC02gxfoaecU1TqfMiZUGCYGeo3fcx9p4C63gY+daSUf5GB9ckE
         Q9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75rd0nxoknxf0qfQbRb/8Y9yf4jaHg7t68qk6D5sD+0=;
        b=na8JcAY4LV143DYOVXJj4iHN3xOPfbLxIE8fhuLgFD8VLvl9u0u+rktyXvR4Kj53dE
         lOtyBUZExcWjvRtgY/JQnBZ3pHRXMI8VJGSXMBDXVuCHOr9Mo5VWIrddagxkvXjRtQwl
         KhsvEgrL3526E4/a0jH27x66RnX41CQq1B09s1jJwKz/4ff9QPsmd1ZcLwS/FfIUOdxf
         bJJum49g2zKPAIK7cuzQdsu/nWZXaz8pM2a/MB+xQNQCe/Z8ocKbpMnCXLlCT+b2GbrT
         8smqPVDULcOj2Ozmu+hZ4U65Hnj8sWkFygGrLJUUf0q2tUBLpOFjQP52dnwgPd7UcUdY
         WQYw==
X-Gm-Message-State: ACrzQf044tAyMNlEo79Dfl3R0IwlJ7lgZ/kzvKrp3W1M7Mf3luCCzDPi
	8tNZwZuaTPiyuaTIlO87ub0=
X-Google-Smtp-Source: AMsMyM5eKPdfYS+IlAZoU0ygqoUgIXnHcMzzWVgZewDNf9rtC0lNn5Px5RhiHcRAVwr9tZ6aB5+WNg==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id h4-20020a056402280400b0043983c28be2mr52629025ede.292.1667844075676;
        Mon, 07 Nov 2022 10:01:15 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906319400b007ae38d837c5sm3802633ejy.174.2022.11.07.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:01:15 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 04/10] clk: sunxi-ng: f1c100s: Add IR mod clock
Date: Mon, 07 Nov 2022 19:01:12 +0100
Message-ID: <3461540.iIbC2pHGDl@kista>
In-Reply-To: <20221107005433.11079-5-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221107005433.11079-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 01:54:27 CET je Andre Przywara 
napisal(a):
> For some reason the mod clock for the Allwinner F1C100s CIR (infrared
> receiver) peripheral was not modeled in the CCU driver.
> 
> Add the clock description to the list, and wire it up in the clock list.
> By assigning a new clock ID at the end, it extends the number of clocks.
> 
> This allows to use the CIR peripheral on any F1C100s series board.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


