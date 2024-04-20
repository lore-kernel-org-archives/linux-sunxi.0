Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6E42044
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713655395; cv=none; b=UCTofELerOu2eNYk8Ju7LaAkqJAXSPt9SoWJkQcYy4MeWk0Idgj5DmyYvXZvS3EgDmGp597Z94ufPftRxd8JSMRvgM3pDrwO3mpCRtJ2DqUphJXt49U4M7rF/n+iulxFOVNl9ujLM05IomjLasbgxq344RJVxEOIt0sXoS4gY7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713655395; c=relaxed/simple;
	bh=bBNbxTaDfIJVcjkaQmgCFXE6pXweSy07pk6tkP8ChP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKtR40WO3sM0TcaBft0BzwbrrXGXl+g5VHQ/GA+efjGdpJ+7iJaN0luDBmy29JUPc++GSMkGm/gOwkwyI9e3tC+za1JTxfcuNjaykF17Im4xIIZXrUrCjQY3B8wVRzbxNUsN53gG2ByEPxOaCCXCioVKMrO1B/PcvJWnaFCL0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pXoJOAfP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXoJOAfP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso356012066b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713655391; x=1714260191; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=pXoJOAfPXfeCNK+RlhAyPFvbWIClmVnFXzdT1or4bqU+v+wTM5lK1Q7gNti94nfJrq
         KpM9FKoeXnj967Mu4BYddyTHSOnLQUG4K31bEBVE6gAzJjMCgq6b80FIw+nKJQWkHRl+
         VaiIatL8yRE3YKRedpIt56spFvJyxM3zxw9keuLCtkXryfOO57ZUgk1x5F6ll+0VJF4I
         hjC8wAvphn42TNXni5kCiN2NpQpFJieZJMBAazQim+cvHnkRAEkfOGzfWESzoyjiB7b/
         C4ZcF6UwNgR0BNBPaDu2YPjG3IGw7qkrS3iC+mVAP+yHvtqu2nurwZrUEhBWgDBoXdhT
         CdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713655391; x=1714260191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=ESt9vaaCGMMuaU3lWjltOPagvFczIlq265CiwEe28leqqLFHj9V6z0ttQEHcr3R+aA
         7jz4qiXA6gh92M/j5qiE3+ZZOnMMQLV5wfLfm/zt+Tt9A8foa47+P0sD32FbMESZ0cS9
         WiLcSRlLWkAFy56bvF3NvEDinPih6AFSmGYob6yrJKPkI00w7CmELhaiQwAkTxNvofeQ
         2Q0E7ESoYsR5F8BTL77Fi0O8PUOOenji+yBnEmrEg12c1Qablr4Dyw25oSM4S1cIdLVa
         RmCxtj/DQQeShtuZXk6zG1z+50+KEuNOkqcYvNOJKXcqT8P06piP8A1poZcENv1/yXlW
         QLFw==
X-Forwarded-Encrypted: i=1; AJvYcCW1wny00GHD7+H5AKuIA5ogK9Qun7cnb9OH0MPjdFtc92Jhmln2F/w3VhWhNK+l+PPtMBPIxNzcu60HjUCRkBGjAHLgh1h0/8rw5qk=
X-Gm-Message-State: AOJu0YxsG92o0ZcwqBtnzvbVF2LpsaAykX8/sxlmaWX5OJ6H9FFYsDss
	3QwhcXnxRKDdxKwqOTBjPF+2O+9dYtxImO5g+zyU1qmdiK8zsTRYeklfzns5dac=
X-Google-Smtp-Source: AGHT+IHIgAHqaBHAo2tv0s9P7hAH/P161Q1ck8771gq2FLpa0nizkFWxKtOsbHWkZLUsCdT//bfy9g==
X-Received: by 2002:a17:906:c24d:b0:a4e:5137:9969 with SMTP id bl13-20020a170906c24d00b00a4e51379969mr4156927ejb.32.1713655391076;
        Sat, 20 Apr 2024 16:23:11 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906339800b00a521904b548sm3889268eja.166.2024.04.20.16.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:23:10 -0700 (PDT)
Message-ID: <27513574-3131-4704-9c3d-f699cc9edb9b@linaro.org>
Date: Sun, 21 Apr 2024 00:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> is not enabled.
> 
> This makes cocci happier:
> 
> drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/v4l2-core/v4l2-async.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 4bb073587817..915a9f3ea93c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>   static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   					     struct v4l2_subdev *sd)
>   {
> -	struct media_link *link = NULL;
> +	struct media_link *link;
>   
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> +		return 0;
>   
>   	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>   	    sd->entity.function != MEDIA_ENT_F_FLASH)
> @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   
>   	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>   
> -#endif
> -
>   	return IS_ERR(link) ? PTR_ERR(link) : 0;
>   }
>   
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
