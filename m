Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7428E1
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jan 2023 11:33:17 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id ay40so22457856wmb.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jan 2023 03:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/hJPuqHDVBK5C/RLmxWV9DciKyeYJTxrtXybCRPl7o=;
        b=V8KmJ8p5/FNTyH0pdGuUPF3yht2s8wE0+QMZjC9UcuigmHdDdiGNKYVh4I+f946kfn
         mc11MMlO6KZiHBuVgY+4uzhlPitnwCuSKJpVvGVFy2wfiCV0XbFKsVQF0I8Nx3SlqV50
         3hLc6Pxf6wM6pU7dxTKwK5f1EyEnJcj3dOQwVnC210eK014xpDKlih/fYk56okahiMFS
         22WXW8B5mg3C9UB3RQTJDMj2m2+/kdjretjIFWWcNiCaHpqwVKOP9RqhlYtyW3xfzaRc
         iTrVKJL4R//qwKyilsQ6sYXMtyT49VqT5FL9ty5MgUxcTMMOEsnAH/xtPifEEHmPv1K9
         I6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/hJPuqHDVBK5C/RLmxWV9DciKyeYJTxrtXybCRPl7o=;
        b=z87e2Eh6RcWLnh383jFNUSkZuEe3zWp4C4x4KmUo+uY2u5NXf/0WqCcNzVXTIiqAZ3
         SEMyDOaZznEMIY8p2B132mIDrogP5Cui6tIn0kTMZFvTMS8sXtyz9tBJBo0o8unjKzHB
         lblWmUoq5jj0WT2h8wRcw0wAt1gBnoAFLmbZUpwEsEcp0SrWmckyaBg/tpc8OLMhE4su
         mqEEhPiWzDdobay2kcA0NQnmSWJXmL756D5TTGJdhedfnai1lqwLla/k76sa3b1ZGVLh
         +Q4B2GmU7HEGBAVXN3srddz8U5HBVWUPuNiSsYkjb9owOytWTCtQnqIviTEbXJtimJ+E
         1Gag==
X-Gm-Message-State: AFqh2kqEU7UOuL+6EB2U1F/e5RWqJR7UxS2YpcUNrmzwJJHcwGqkqxyz
	VgxuW8M9SqMQKP69Rq8YePVIyw==
X-Google-Smtp-Source: AMrXdXu1/BlJjZPE28WihSovTCFi0Eu8CmzQeOrGtC8qggLMpSvhUuh5xzxlJLPcacaQ11GN2RFbaw==
X-Received: by 2002:a05:600c:378c:b0:3d2:1f10:3318 with SMTP id o12-20020a05600c378c00b003d21f103318mr34604536wmr.31.1672745595428;
        Tue, 03 Jan 2023 03:33:15 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id t184-20020a1c46c1000000b003b4a699ce8esm46770088wma.6.2023.01.03.03.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:33:14 -0800 (PST)
Message-ID: <fc321ad7-0622-5869-d934-97baaf540c07@linaro.org>
Date: Tue, 3 Jan 2023 11:33:13 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/2] nvmem: sunxi_sid: Fix for D1 variant
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20230101183316.43642-1-samuel@sholland.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230101183316.43642-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/01/2023 18:33, Samuel Holland wrote:
> This is the first two patches from [1], with the stable CC added.
> The first patch fixes a bug causing incorrect values to be read; the
> second is a cleanup. I split the series since this bug needs to be
> fixed regardless of the DT binding discussion.
> 
> [1]: https://lore.kernel.org/lkml/20220814173656.11856-1-samuel@sholland.org/
> 
> Changes in v2:
>   - Split out the driver fix from the other changes
> 
> Samuel Holland (2):
>    nvmem: sunxi_sid: Always use 32-bit MMIO reads
>    nvmem: sunxi_sid: Drop the workaround on A64
> 

Applied thanks,

--srini
>   drivers/nvmem/sunxi_sid.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
