Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA270
	for <linux-sunxi@lists.linux.dev>; Mon, 17 May 2021 09:18:28 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 62so2120927wmb.3
        for <linux-sunxi@lists.linux.dev>; Mon, 17 May 2021 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IX9RZXfFga5iXe3mICM7KOM5tFlUzc3tRZqVFzUyLR4=;
        b=PjJKL/1udTlUp30HIiNAsKUkjZcr5AN8ovZL8d0SNZkEIk6gp6ys+I0Pr+IGjg0+EA
         K0tWzGtKzI/A4zOMBk5MlEqqN9i4vbGZNyYE2+/0+KTW+nOQf17IlU2YUx2jR5U9qhmq
         5Vmz7BFVkTft8RTIgCgyVosBY+/TA0Wkqw9kh4i3oCRHJKvPc7qbQK9xBEEv5X0iIaAL
         G59bx5PWRaevqSmHaySciCgXEJHuPjKOJDXG0Pt5zSndd4+N/m80jQTppPl7PxXxA6YQ
         NcIj4XxI8xLh/L840hAkuAZk23X+IVF3bgUJqL87nXuXv4q3luJJbVz3GlzxhJ2gOrd5
         LVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IX9RZXfFga5iXe3mICM7KOM5tFlUzc3tRZqVFzUyLR4=;
        b=T46gARYYqHENaRekDlCgHmJ1YCXgjrPUchrYRtFQ+UxTFuvp87mV9rkMn1lAqC5i7h
         PJbpJfq+unxjpGw6K4zvI7eWzW6YuY3ypi6r3tggoyaZZMaDtmhy9heV9DJIUatbndz9
         6EHgVmJuLOG7z8a6F/ZDenp9RRBkm0iUGuyTgs09+GMnRVLvE6RGeVRhaN8yED2fjIKP
         4krgGH2OF2IM/d7V9ggCjQTu6TuHcmHxnSWTYpX6clua1JhYTGLNkSyLwTspBrYtKEGz
         DqQYy0qbzXyfgzjUuUTKliTkw+iGIaGszOMYib7oqRPnz4m0ak2H3Wy4apc0nBL+jc5J
         7r6A==
X-Gm-Message-State: AOAM5303r7MgrXsBmAUttkIc/GEzdKaF+2y2vRptG6YzqJis6+RdTPrS
	NFAagDYI0q+6BVpI++d6jDY5+w==
X-Google-Smtp-Source: ABdhPJxB7jeEwnXTieUCoUMFatB1OGox14Ekqq/eZZAD3PwXeXuelJ1qhm/jOlvS4van9g3I7yk8/A==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr4834155wme.178.1621243107107;
        Mon, 17 May 2021 02:18:27 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id s5sm15593242wrw.95.2021.05.17.02.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 02:18:26 -0700 (PDT)
Subject: Re: [PATCH] nvmem: sunxi_sid: Set type to OTP
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210419015815.38910-1-samuel@sholland.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f71f9e50-6741-9352-4a72-1f82726945e4@linaro.org>
Date: Mon, 17 May 2021 10:18:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210419015815.38910-1-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 19/04/2021 02:58, Samuel Holland wrote:
> This device currently reports an "Unknown" type in sysfs.
> Since it is an eFuse hardware device, set its type to OTP.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---

Applied thanks,

--srini
>   drivers/nvmem/sunxi_sid.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> index e26ef1bbf198..275b9155e473 100644
> --- a/drivers/nvmem/sunxi_sid.c
> +++ b/drivers/nvmem/sunxi_sid.c
> @@ -142,6 +142,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
>   
>   	nvmem_cfg->dev = dev;
>   	nvmem_cfg->name = "sunxi-sid";
> +	nvmem_cfg->type = NVMEM_TYPE_OTP;
>   	nvmem_cfg->read_only = true;
>   	nvmem_cfg->size = cfg->size;
>   	nvmem_cfg->word_size = 1;
> 
