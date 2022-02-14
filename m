Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EBB7C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 10:50:00 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id k3-20020a1ca103000000b0037bdea84f9cso10550263wme.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 02:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DXv8SmLAPMNrPJ3mqwP/UuQ6ZTsnkTp239g0OTWzlWA=;
        b=Mzulk2XClL7m/nGCOdw94t+dgDFGHB4aVksteuofaaRa6xxyPqxvdn7NK6SdQpTIMm
         84gOQ2nkgwCF9lkU3ebqn9ocLqVhl9nK7Ol91VzuatvgUT3/MILOC8C+5Dge0ll5speM
         OPvTq4XR4At4lH7P+VkO3WylRaVGmycHr8XnjFvvjFWoYFm2f1BQtXk2q6Pr8qQwOt3c
         Nc9YMgKNlihGbhiwqPc3Hs7FekGV//l+Px+d3fDULIOGW9seSwIaQSDaiouk5PerQLqc
         j1auWiU7PiaW3VMZu/4Uh2g4Wcc/fNkhXlYwqYQWnZU1G0FGf7yHWAlqbIYnf4cv1g8a
         VHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DXv8SmLAPMNrPJ3mqwP/UuQ6ZTsnkTp239g0OTWzlWA=;
        b=0OwYR7blWo5U1FmhUXG+2MiePMRYQPLnth4uXz1Sl3VtByz4gd3xR3/yHWgHPJS+Ls
         07WcAZi0y2/M12rEuf/MRZ/0NiaV/MNCC3FgmmXk138u72mAHfZBGMdt0Fl4y4zPApje
         LCMG68ePxY+QNv/qUSFdsH7f9Xjik/notSxzJKMw4Cqu/nZcFc16l2qoO+tY6TjCTj9i
         jLU5lqYzyOUjDOtld5b6HSoiHNt7yMmonwvlb0Qr7CBGXDC0r2drAyHbT9hHivYtMz2R
         Z1+iUjC39DSdfp5KIi+dQBN4ZZULb8Dr8kuiDOnskTLEkePHuslHktgpnhSBWdK59mCv
         EBZg==
X-Gm-Message-State: AOAM532sKQsXhnwA2TqLcPmsPwX5LvcP1ZW1+IymkK8OX9j+KppPZhu5
	5LS6lwwUxvXOzMJWERN5Cz5Tkg==
X-Google-Smtp-Source: ABdhPJzKJsy80xYZ3+bzTwXnv+y+Y5fOp64rrpJitEd3V8DuS1Z1Eai8C0vh/48VKS2HutAE73zE3g==
X-Received: by 2002:a05:600c:b59:: with SMTP id k25mr10603699wmr.170.1644835798574;
        Mon, 14 Feb 2022 02:49:58 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id h6sm1920631wmq.8.2022.02.14.02.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 02:49:58 -0800 (PST)
Message-ID: <7a796e98-ef79-e50f-77b8-0b7ae533f06a@linaro.org>
Date: Mon, 14 Feb 2022 10:49:56 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: SID: Add compatible for D1
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220203012502.10661-1-samuel@sholland.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220203012502.10661-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2022 01:25, Samuel Holland wrote:
> D1 has a SID like other Allwinner SoCs, but with a unique eFuse layout.
> Add a new compatible string for it.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---


Applied both thanks,

--srini
> 
>   .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> index 6687ab720304..e558587ff885 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -20,6 +20,7 @@ properties:
>         - const: allwinner,sun7i-a20-sid
>         - const: allwinner,sun8i-a83t-sid
>         - const: allwinner,sun8i-h3-sid
> +      - const: allwinner,sun20i-d1-sid
>         - const: allwinner,sun50i-a64-sid
>         - items:
>             - const: allwinner,sun50i-a100-sid
