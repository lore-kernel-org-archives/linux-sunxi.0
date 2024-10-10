Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D4F1BDA87
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 22:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728597715; cv=none; b=ZQMUPEt4mCyHmXGsXvu3DrsvlNkyKZgpCC1BE0xhGpVcZWeW0dspxkfz9scRjmHthZeuGcBeHK6vwOmv4epNVAYlSPVvCsXhErVCwQsBFMYkoRuGEwCih4kDCJ2DtarfuGXyIjpxXU/mH5314+buyoDAXQTXSRyC9robIAU0as4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728597715; c=relaxed/simple;
	bh=cfsIjF5ZKXnPFP+qfupxmI4Z5J8YfoMgIDvOaduggd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcBmeitRImjWFN90A1CgIsW+qNGAJTEfLKwn0OelspVINE9i/eD1uYl4zROIYppzFhX+52Tr39KyrCtZiOAlomi80zxVTPQP2QXtVOmFqVXndQCU7aaBURWU8wdVgIZkQ3UySfS/ZDkifnRvPALtlIkWhYnQ2M9XHFbacIDfGog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvUxjB1K; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvUxjB1K"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43116f8a3c9so13143565e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728597712; x=1729202512; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRo5pZaJYjcwJ3wqBtd7Mqnyiz4mZlGFWnd1eshq0HI=;
        b=EvUxjB1KCmQQtexTtFwyr2nwhKU+JMCDVKllk0N+dLwgOSiQOY1vUG9Qh5Iu3RmFqd
         fcoDe9hAgSMaleFRhQo0lZlTcRmKai6P5J6TUh5Vx2IYq8+QNsJH44r/NMNyiStJ4eVY
         HP75vuC/Xp8JeJxeF7+VtOQkvRoH7nQaekUmLycIK1y3DFXhdUsfNcDBSjv9jxuZK5n9
         4gqDU3TqHRE+mSU7shwDMmgUwsthPFGdVMkojeS6AsrJVURBRKTx9aZpndiURnsK+TIh
         QPCGvyLJAkp4WokQ5GRxBCJjfaLo0SNfzu9w+3u0edys1rInJkSJn103VhPXPeM7tvFw
         KQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728597712; x=1729202512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRo5pZaJYjcwJ3wqBtd7Mqnyiz4mZlGFWnd1eshq0HI=;
        b=MHC6hpB5TN2VdypNbLTle9ML6KlXE783JDu0dAxytiEaJkSjtBZUDWg/Dyih01nEON
         hVBZ2Vu8bBwvC8SfT+rMKgmeryRgx1gsp1EdyICavkNyPgNmseumZtD1hz8y0SnHgG8v
         k0XQ6HZB0Hdap+875WeTqPsJdcHoELv1NrhwtO+LZ+K8kvXFpZ9ypgMBbCBmp2uCpFPb
         81V69c8hpkFqnNXGGIEejC+dEFgyVeqiGDNSAd5iQcDXosd3GpUIdNsUgw3TdcRDSJm0
         KzLp08u1gL2v5MK4hs5pZ5AJ13QUXP+s5G8G8p17YFvuupbtEwNCLF1m5dQxkS3TzcD+
         YHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZX9vYp85kUG5FWJTFika1r4Qwzjf8tuIcrmyquR9ZEzJJRK6UxQJO+RPU94zjcTHRuA81NE3cVHVuGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeXcdnVo/oWKYpNckLfTZWgBE/rDZP9u++TcSGfRasW3a7Z7Mb
	OUfatO1kQTW1bsK+I+uDbtJAg3PX40lvHshhjyrUds/4r2VPh7iD
X-Google-Smtp-Source: AGHT+IGXyz41JoTVviqZ6D56nKWyD7SMBw2XM/zgZy0gAt+4cCNQIYl2jc1hqRENs3/tmimOyBTBmQ==
X-Received: by 2002:a5d:67cf:0:b0:37d:2de3:bf8a with SMTP id ffacd0b85a97d-37d551d541amr439244f8f.26.1728597712420;
        Thu, 10 Oct 2024 15:01:52 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d793fsm26275335e9.9.2024.10.10.15.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:01:51 -0700 (PDT)
Message-ID: <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Date: Fri, 11 Oct 2024 00:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241010214348.GD4017910@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2024 23:43, Al Viro wrote:
> On Thu, Oct 10, 2024 at 11:25:56PM +0200, Javier Carrasco wrote:
>>
>> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
>> index 20020cbc0752..bb1c732c8f95 100644
>> --- a/drivers/input/misc/sparcspkr.c
>> +++ b/drivers/input/misc/sparcspkr.c
>> @@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
>>  {
>>  	struct sparcspkr_state *state;
>>  	struct bbc_beep_info *info;
>> -	struct device_node *dp;
>>  	int err = -ENOMEM;
>>  
>>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>> @@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
>>  	state->event = bbc_spkr_event;
>>  	spin_lock_init(&state->lock);
>>  
>> -	dp = of_find_node_by_path("/");
>>  	err = -ENODEV;
>> +	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
>>  	if (!dp)
>>  		goto out_free;
> 
> Sigh...  See that
>         state = kzalloc(sizeof(*state), GFP_KERNEL);
> 	if (!state)
> 		goto out_err;
> above?
> 
> IOW, this will quietly generate broken code if built with gcc (and refuse to
> compile with clang).  Yeah, this one is trivially fixed (return -ENOMEM instead
> of a goto), but...
> 
> __cleanup() can be useful, but it's really *not* safe for blind use; you
> need to watch out for changed scopes (harmless in case of device_node)
> and for gotos (broken here).

Hi Al Viro,

sorry, but I think I don't get you. First, I don't see sparc64 as a
supported architecture for clang in the Linux documentation. Maybe the
documentation is not up-to-date, but I tried to compile with clang and
it seems to be true that it is not supported. Anyway, that is not the
issue here.

Second, I might be missing something about the scopes you are
mentioning. 'state' gets allocated before the device_node is declared,
and when the device_node is declared and its initialization fails, it
should jump to 'out_free' to free 'state', shouldn't it? Sorry if I have
overlooked something here.

Thank your for your feedback and best regards,
Javier Carrasco

