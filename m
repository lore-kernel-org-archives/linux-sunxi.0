Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B029134BD
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 17:55:29 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso8554870a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 10:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689702928; x=1692294928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pE1qUAyXgxKm4FKDn6d98dPZAsbuyVV+oDCpGCKIXhU=;
        b=yKU7ey9m0xAO3Q8ywQtNs2uzVpbTKYk2Oz/Ja55cbIzHogaqystU603eY2x5/YqfGX
         H9naCLbpROzYaCTVDOp6twWnsl5mpSp/Dgsp4I3itzTPTXDBboyf2yc6kLV/zPioOXOF
         jvU3DR0kjkVNfcMjGtCq1OoqtT0R9oRe1EbyGkohqS5nP8DQK4hg+a6WfdjX/7NPp1VJ
         PmhTujoe7StxAl788QGqCF0DEMGd5CplUQSa93Rbnq5eh6ufJ05uoRGnsRWB0clgWrqh
         sX0OSCjjhSmETSwQB1Zg42ZXspK36gFDQnHY7rm8MBKSea8NYogWPy18kIhsH9+IknFs
         LGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689702928; x=1692294928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pE1qUAyXgxKm4FKDn6d98dPZAsbuyVV+oDCpGCKIXhU=;
        b=M4HM8vEwvTHcuO57dyyD0S8BE76A15IP1cCgCxXq9YWYYP5WMiZGHmTSodOmXjM+qC
         w3NSkKEP3d2heyTunlANTcoJzdVDmpkz1QLo/0zYbMkWm/sNK8tEemuZDLw77sWIRdVr
         NX2au4Eq3ATqNfLii/NZQ3ZouiBpfVtG4xrFq9TidzURdrk1+xrstnFLLhJzPWFj6STy
         ENvKiY6qv8QHXSoMRyItVzk/u0RkmxmL7ZwLjLjvPzRwiDTOTMBMnBt8L3Sl0a/ZpZ5E
         84EYgDCc1WoiBHI5PlhrhlkDv8X1EGk5vaeLNIzA8usObPGejil9usgYus/8ONj80f8s
         dsug==
X-Gm-Message-State: ABy/qLa1Q+O4EI5guijlbF33mVv8oI43WKIlNwW6XZzHCEKddTTRiFGm
	FuD0UY4vY89qMaqG1IuYOcYsaw==
X-Google-Smtp-Source: APBJJlHYuGKkFhUbj4/g+lnn7IHgZET+cWPwb/gciRk73Ap9ki4NtfiSuNyeWYGARK+7KsmckTS24Q==
X-Received: by 2002:aa7:d412:0:b0:51d:e4b6:ff6b with SMTP id z18-20020aa7d412000000b0051de4b6ff6bmr377730edq.33.1689702928194;
        Tue, 18 Jul 2023 10:55:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a19-20020aa7cf13000000b00521936fadabsm1530499edy.89.2023.07.18.10.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 10:55:27 -0700 (PDT)
Message-ID: <715caa18-e772-0b5d-4dcd-49a05eedf2ec@linaro.org>
Date: Tue, 18 Jul 2023 19:55:25 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad DTS
To: Matthew Croughan <matthew.croughan@nix.how>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230718152206.1430313-1-matthew.croughan@nix.how>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718152206.1430313-1-matthew.croughan@nix.how>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2023 17:22, Matthew Croughan wrote:
> Mango Pi MQ Quad is a H616 based SBC, add basic support for the board
> and its peripherals
> 
> Signed-off-by: Matthew Croughan <matthew.croughan@nix.how>
> ---
> V1 -> V2: Alphabetical ordering, added "widora,mangopi-mq-quad" compatible
> V2 -> V3: Added Signed-off-by, add to device-tree compatible/bindings documentation

Thank you for your patch. There is something to discuss/improve.


> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +

As checkpatch tells you - this must be a separate patch.

>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../allwinner/sun50i-h616-mangopi-mq-quad.dts | 183 ++++++++++++++++++
>  3 files changed, 189 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-mangopi-mq-quad.dts
> 


Best regards,
Krzysztof

