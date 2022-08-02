Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B07F
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Aug 2022 10:41:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id v7so7517722ljh.5
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Aug 2022 03:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6zonPHc10wroJYzLLqDfZXlsbdw9PnagEXnZiDm2IM8=;
        b=qhkT18pqWd4Ope24rPhU4UQNXEeEhU8JPJvRH/jsNkNGnGEFvkoGfIvgq/QU0EDJIE
         uaDX74nH7ivlK6+KPpyITD9GALgHx/sBnO6Nv8C47nSStcHeSLqvR/s38UOtPflpYa0D
         fsNzs6BYIi4hPckKg3zHv2VujKa1YpGYaD7+IkrOttF+n6fk9mdpeuTF2Dbh8Ns/lfPM
         KZr8r+p1NbVIrlggQQmoKDrM5DnXN8welF9mX+hK7WaG10TaKLX8QL7BduNSr0f5CmIb
         HF9e7jzB2fegrDnl9gcIA78opJ3eZ6WvYJ1lwjS8jCt/x2mBVE+uWkkXMCsMAkAfTG8b
         3sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6zonPHc10wroJYzLLqDfZXlsbdw9PnagEXnZiDm2IM8=;
        b=l0S9PUQPCDolsHj97p5CsCkdwEnM7OqR/afRMGEydEgfO95Y8/xrSaIDT2S1Z5WIhl
         mCWkyhy4G4bZK/miJPKVJ6lGH7szZwgV5GdvYV07B4m4FKtpf8TY5vmT7vfK2FyD9grv
         5o7bN59Dldc3vl3TNCkju9hbzbNRpoioCQMjgpSloaWX0wizZfsDtQnTljZV/z4wayl7
         L/YTitS/u0ZgtM0kwWGPmPgJGIAbt25Ci9Bmads9B7c0r83ePPt6m801bu4VYtf4N27z
         h9xahJq5igzQBbrdZ+iVE5QLcpanln4u0iynQ0RFDH0VVPQsVb02VkczxsZcvsvU7eam
         z0gA==
X-Gm-Message-State: AJIora8d/AzVHiYEoMYmnmQ7jiIOJaWHbdz+qXCTXwoxmVOFx5ZtXnDl
	SWaZ5/XrA/wX2ahRwepU/XrGGQ==
X-Google-Smtp-Source: AGRyM1viAq740fqolN8iRpjad6KZJCVIGS0x4H0903BIUCQeult2NlMhLbS6JRtnajWOcqV+6gk1kQ==
X-Received: by 2002:a2e:a812:0:b0:25d:d922:d with SMTP id l18-20020a2ea812000000b0025dd922000dmr6081524ljq.181.1659436858230;
        Tue, 02 Aug 2022 03:40:58 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id a42-20020a05651c212a00b0025e3f7fe9fasm1342295ljq.67.2022.08.02.03.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 03:40:57 -0700 (PDT)
Message-ID: <1bbb7f38-69ba-583c-e8ae-ccff3ad8f08d@linaro.org>
Date: Tue, 2 Aug 2022 12:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: Ban Tao <fengzheng923@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2022 14:51, Ban Tao wrote:
> +    dmic: dmic@5095000 {
> +      #sound-dai-cells = <0>;
> +      compatible = "allwinner,sun50i-h6-dmic";
> +      reg = <0x05095000 0x400>;
> +      interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
> +      clock-names = "bus", "mod";
> +      dmas = <&dma 7>;
> +      dma-names = "rx";
> +      resets = <&ccu RST_BUS_DMIC>;
> +    };
> +
> +...
> \ No newline at end of file

This has to be fixed.


Best regards,
Krzysztof
