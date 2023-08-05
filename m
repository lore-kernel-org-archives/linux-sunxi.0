Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF571FA5
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 07:12:57 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52327d63d7cso576345a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 00:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691219576; x=1691824376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EYKHh9zvdAN2J1bA5/eS1HMxCXCRGCzihmZHexGE78=;
        b=k1k3AGZmulqQC8ludWvwxbPiYrcVqk+o7I68hdA9euUYhnNu7buw3mc9Lm7HHiDDkz
         u/r86NEkT9ycpKdcFLo+o6FGvlxHbT7bzJ52FVp2/gpPUe7hy3+EHe+n50gfFt5qbu/t
         7/Z2B91DENrTVCGt28Dsr/Tt8z7eyC5/oE7IBXjocUG46pnhI63N5RwCCEpdCMkExvk+
         s8roCyu4Xfj8MHQbRKo71dx1BM5qaKq2bPh49C7L3kPlLg403q2ySgeHlM8bK7zhlx9e
         jXNDlrxhICvlw2xIvO/js9FwG4CRqjlK6rDjmnz3XoXTWW+mB0/p1u4/7FX03bFZ0Ypw
         0Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691219576; x=1691824376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6EYKHh9zvdAN2J1bA5/eS1HMxCXCRGCzihmZHexGE78=;
        b=MnyLEeuwcp44tP6uUbueKz6kJLcJSlzYn+6QByQITXIh97vCE3wTDaf/hMA0sxnetp
         5zN6P0vYA0A8i55Z+f+Oj4/8lUj+Cg5aac+o1ax0uca8i2rNYcXqwkJbEe20EVFdZaHH
         5GEoE21jvTBI4T1snngx3oVtBtqsdd523nhkdSppaWuZRZdg/oUUQgNmesoBVwvcUTXO
         N/xF9tTh3AvPpGXjRNp9KI62jDmSe0KkWaER9MgZLtxef/0lGrPCHhKiIuvEZKswbBnY
         mNHa+1DzHIrTEmDeei22tohCWQdo6vOpjv6j2Qnvr7RNl2pcv6wWKg0puy3pExp8y5pB
         gQPw==
X-Gm-Message-State: AOJu0YwJRy2K+sNMD9fWXuur7uhzdaNeJnH3lnjA1F0zzI9yCJP+gken
	Q/Jr8pexDUpiEWVme9UafwA1Vw==
X-Google-Smtp-Source: AGHT+IEBKGPV9a+L0ZJ9F30Yqa3AMwT7ZmB0w3Kd7xbiSD1oCem6izMufS7UEUKCnXqOxqNDfjIOIg==
X-Received: by 2002:a17:906:2081:b0:99b:c689:3f3d with SMTP id 1-20020a170906208100b0099bc6893f3dmr3165876ejq.25.1691219576097;
        Sat, 05 Aug 2023 00:12:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id bw4-20020a170906c1c400b009829d2e892csm2366994ejb.15.2023.08.05.00.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 00:12:55 -0700 (PDT)
Message-ID: <c113197b-038f-c2a1-bc83-4e009b4ac187@linaro.org>
Date: Sat, 5 Aug 2023 09:12:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 2/2] arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad
 DTS
Content-Language: en-US
To: Matthew Croughan <matthew.croughan@nix.how>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230805044558.279473-2-matthew.croughan@nix.how>
 <20230805044558.279473-4-matthew.croughan@nix.how>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230805044558.279473-4-matthew.croughan@nix.how>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2023 06:42, Matthew Croughan wrote:
> Mango Pi MQ Quad is a H616 based SBC, add basic support for the board
> and its peripherals
> 
> Signed-off-by: Matthew Croughan <matthew.croughan@nix.how>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This is FAKE, no. Please do not invent fake tags.

Best regards,
Krzysztof

