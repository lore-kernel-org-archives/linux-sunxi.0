Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F326E7E7
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Feb 2023 16:46:04 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso4162421wmp.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Feb 2023 08:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Be6m4n2yTjxOG3cvlCymi9AVSjJxGyk5S0njtlmi7Ok=;
        b=cA0mfPHR1Xqc7an5XX9GrkCSeUT0nmi1XnDca8+0UZzJ2Aw0yyiiBYMu7rZSQ6nQmT
         pugxP8g9LCTbjZ8VXZlZ7R5eTXYNHfD23nDdHWCN+JNRV/rt+STOUL4fnIvq9Z5UkiS9
         zv1gIlR+XuaL02QSJgLFzPxtg8Iy8WRa7GMCJCggrm6RrEJ/ueNjm4++hYB9frOJjhoW
         U2ZA4Qjsy4oUrs8tgK2EefqkIpUv7B5q0ji1giOpqs8kjYfJROHm5ryzPeX1HfIcmy33
         ehY3W5VkuzEWZqk221STNsYgl9sHdhVM24j1piItHbfYJP3iIVWWl7E6ZPw5XB+Rt/Aa
         9WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Be6m4n2yTjxOG3cvlCymi9AVSjJxGyk5S0njtlmi7Ok=;
        b=WMo5dlGb4wd1pYSDFpE4R/rrOHHf/s5/1Z/eNBGJRB5LzoV0KDH23F95hKOJ0F2nCa
         X7hEIzvsScxZXZb+1tetG28kbdDyg4QCgSSxJOgeYvv0XlXIyb3UWMRLmRDMtqDa2O7I
         NU3pcyXaGTmO+rbrFI8lmZ8ioujz05XRifjrIod6bsSnq55YRSz2fq40bSgA+2gPp9sg
         PsJmDZkFTRllVtQI2erq2q9VhqZrVBrA/s/w6Pev3a3FrQNADbG5X385EmX/UX3OPnmj
         1e8grQV6I43+beGQUCTau/crWJuCjubzWokbxTNzetnUXMhai0PRWXry+EYeKgn6vusL
         JngA==
X-Gm-Message-State: AO0yUKU0vflP5mePTnF/KwI2xsFchAEc2YCnjOtP5CDEMlcaYoW36xPK
	Ltf6vn3l22C6G/3kOW2iGoJ7LA==
X-Google-Smtp-Source: AK7set9k2KtdeDKVcscpUyx6R5b36GQ/sv5f3qbkMR16PnZLnkTxqesp0C66to1pdh7mwuTQqWi73Q==
X-Received: by 2002:a05:600c:1c88:b0:3dc:1687:9ba2 with SMTP id k8-20020a05600c1c8800b003dc16879ba2mr6840135wms.35.1675356363119;
        Thu, 02 Feb 2023 08:46:03 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id r12-20020a05600c35cc00b003d9fba3c7a4sm5925540wmq.16.2023.02.02.08.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 08:46:02 -0800 (PST)
Message-ID: <88ddcf84-47ed-109c-5fe7-1c213abb0340@linaro.org>
Date: Thu, 2 Feb 2023 17:46:01 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RESEND] dt-bindings: timer: sifive,clint: add comaptibles
 for T-Head's C9xx
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230202072814.319903-1-uwu@icenowy.me>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230202072814.319903-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/02/2023 08:28, Icenowy Zheng wrote:
> T-Head C906/C910 CLINT is not compliant to SiFive ones (and even not
> compliant to the newcoming ACLINT spec) because of lack of mtime
> register.
> 
> Add a compatible string formatted like the C9xx-specific PLIC
> compatible, and do not allow a SiFive one as fallback because they're
> not really compliant.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

