Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116F033CC
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 10:01:25 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id r17so14211334lfm.11
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=CNCRgWb3pKggt17+aZXpum1u8S3P+8WTUXBySzZQI58=;
        b=u8tTO6zfQ0qFZw3+/8gsWraUU5j0AIjWN3x1bqyf9laYvSyQd8Itvzf1kOeWEqwBKB
         xUag+Gf5BJ3rGN146NfaO1a9XnNUCdxlyHbtGnBr+vxqGjAjm/pWC3qFkGjiyKGUovyB
         OZ1Fw0ahjmz7wdBBFqqV0lUmrmaC2O9bouLWCp8+ca/qTnmQ0CYhx9o45SDbRffY9ePL
         o62yihQQ1ZJRmvT/aAM9Zr9ybrLKdrllefTqpXF2azRLRdbCBkUe2z2/MAImVsR2N4YY
         khI6i4qbCzktf88KqfHralU+C+TaWi2roO9MAqAAiNXMtkl6DCIBvHJn0xNoCy1D3RB6
         B01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=CNCRgWb3pKggt17+aZXpum1u8S3P+8WTUXBySzZQI58=;
        b=hvoz6nQVQqOn8fCcFj9WRPtkcoaPcCRgVVeBZuAuHp4/2ZghKWjlSMmf0D6s5vGlYH
         oAgbT+4P2o57+zinfOm7RbxdT5NhtDdAQLHLy54HHSj3oVVwCV8C9zbIt1yAsNfMOIz2
         mhQlwB8rpoNUH2ekAfN53sYamU//dAY41acbtbtGytiuxQlwIZ/qKssquFEEPc/d9/07
         m8yk/hAOJ2/loZO91dZTJ+jnlzv0tVmf9Op5xj5CjPKW4guf5IG6EE3P6hnY4FtOi3cD
         3LX5KOKnCgKdf9zEFHq/mc90H3PQ/ITUGa8wU8ZWov6/d1I9EWdDsa9p3OQFWlnTy7No
         zfkw==
X-Gm-Message-State: ACgBeo365/vw72NMVhA+/lTrVoVgEOQtXwYdGKaeNi1KUPVLVytR8jgY
	SAQ9/BdIVX088znHPGBYrgUpzg==
X-Google-Smtp-Source: AA6agR6lmsJwUYBKcY0okFYg8s4OfF3eRvQDWTjCiS+uHlaWGQrsC96OPA5p3aT8yTvYH2UFjTAU1A==
X-Received: by 2002:ac2:4db6:0:b0:48a:f9b6:bac1 with SMTP id h22-20020ac24db6000000b0048af9b6bac1mr6550327lfe.669.1660644083188;
        Tue, 16 Aug 2022 03:01:23 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id u9-20020a05651c130900b0025fdcdad0e4sm1024424lja.35.2022.08.16.03.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 03:01:22 -0700 (PDT)
Message-ID: <e5969030-0a17-d10e-7eef-8d906e8a4dc4@linaro.org>
Date: Tue, 16 Aug 2022 13:01:21 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 4/4] soc: sunxi: sram: Only iterate over SRAM children
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220815043436.20170-1-samuel@sholland.org>
 <20220815043436.20170-5-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815043436.20170-5-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2022 07:34, Samuel Holland wrote:
> Now that a "regulators" child is accepted by the controller binding, the
> debugfs show routine must be explicitly limited to "sram" children.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>  - New patch for v2
> 
>  drivers/soc/sunxi/sunxi_sram.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 92f9186c1c42..6acaaeb65652 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -120,6 +120,9 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
>  	seq_puts(s, "--------------------\n\n");
>  
>  	for_each_child_of_node(sram_dev->of_node, sram_node) {
> +		if (!of_node_name_eq(sram_node, "sram"))

You should not rely on node names. They can change in DTS. Why do you
need to test for the name?

Best regards,
Krzysztof
