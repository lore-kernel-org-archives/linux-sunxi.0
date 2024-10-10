Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6B1E1C13
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728598148; cv=none; b=VLcxFXS42uebzwHh4ohn0Tuxb2mRWZQmbMrk0ME7kaeJsmvXgt40yMjfeTzuOlt/ZJruy0zH4bB+PUx3RCIYk6ssrDQL9Zc9ExZTz6eKoRIWA2Y23i7DfCFNGRCVkdtswuYLxdPWdPddSEzz0LOxqQZROg3ZrjHoVV7KxxtreWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728598148; c=relaxed/simple;
	bh=VUlBSWfqgFUu7aGU1pR2gowp/JZI8VAcfhNV6QFmISQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BC2qyuL5etp7QusHy2nbHH+P6P5B7kr5OSn+ZCsfmcD69V8ksE457BB7vEvZsHtBy/E4h1ffgyr7xtq4cRx5oN1u1Jtw3TwsqK+W73Okcl6Xg1xY+ZRAk6ScGMbs7CRkWm65ifPc5btsbj4ZxmS4kU3ER2xQkE65e+D9vuxpuUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE/Vmh1W; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE/Vmh1W"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4fd00574so631385f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728598144; x=1729202944; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ttbGIV1OtP6Y+L+hzzhjHcgo4Ic64lUH6bhnz6qvucM=;
        b=PE/Vmh1WwsB/6QBuKfNP6rJpn39fdGxqQEbUl3nG9rxAducybk1Lunp48h0Rk0j+Op
         nEyWRlE56XE74IwUm1Qlq0sazTc2dnvta6QuB7h0mE+/rBcYWQMPw9FJLU21yaXHGTDz
         biLAu+O4tj+5swnGxuMzMCANd5orYVFJim98LS11CZ6QaN4WxvkrzeofhNh0LqSzc0Qf
         s94WCBH/Op33Cg9Tv+RhJzyMghfZ063x/pb/5je0vUa9CQRzCT4L9qYDoHK4VXx34mVm
         8XEvT498qviaXnNWLSMUCZQFIN8WU6Vx3WFc5sWi4tEh6cgFW6Xws3kSce/8PSW2K+8Q
         NLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728598144; x=1729202944;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttbGIV1OtP6Y+L+hzzhjHcgo4Ic64lUH6bhnz6qvucM=;
        b=eF6x+7YQhjadax3yUrZcnATDLdUIH4cJ2oi4Wd2qo8omXU8nbU5v6Ba+GVTdbhX5ux
         FGTU2nGFQI5tHVrvkamNO6eDHNhfMbDp8fgjCIEHX9j+wLnAbW0L5M25Zkef5at2v7so
         FifFieefwCV4Asha2iOxoXaO1BbKSF4T2mkaqLb+IKSVFjdD/GgsvS5prEqltcdBeJVp
         ZV9SENclCb5Cxsx5DDgnQIMMnoiBwVuDu+2gzJyvb3yiiilfE+PQK0EE3mFpbL9BO/+y
         uGi/E5EHM104cKjL2KIV/f24gbcsFSw/hVRovnOFH8EuxNRn5pB4dNQ4lCjStGSQxW7a
         My0g==
X-Forwarded-Encrypted: i=1; AJvYcCUaW+2oPGgD+c2h6yOy+MJgfe0FCFm4ggJUhpXgIGlsOwoeuwgeCdAeXOkwUjzTDvMo1D9EpcKlwY6O0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6RS+AEb6+EO1TQTVAEYOragz+Zl9sX1IEMDxU51g9Yu9/lbvc
	l5Zr1P25LGpggeimZi4d6pxmFi2cnL4QfB9U9VZqAdoShreqEFm2
X-Google-Smtp-Source: AGHT+IHeSJFBVDM1SbcoY464K/ygl3HCvWV7h/IxMrNG/Ut2dgNjnOJVa/rz3Jta9HcTAJ32IG2XeQ==
X-Received: by 2002:adf:cf03:0:b0:37c:c9bc:1be6 with SMTP id ffacd0b85a97d-37d48194896mr3864214f8f.16.1728598144208;
        Thu, 10 Oct 2024 15:09:04 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd3dcsm2451217f8f.42.2024.10.10.15.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:09:03 -0700 (PDT)
Message-ID: <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
Date: Fri, 11 Oct 2024 00:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
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
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Content-Language: en-US, de-AT
In-Reply-To: <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2024 00:01, Javier Carrasco wrote:
> On 10/10/2024 23:43, Al Viro wrote:
>> On Thu, Oct 10, 2024 at 11:25:56PM +0200, Javier Carrasco wrote:
>>>
>>> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
>>> index 20020cbc0752..bb1c732c8f95 100644
>>> --- a/drivers/input/misc/sparcspkr.c
>>> +++ b/drivers/input/misc/sparcspkr.c
>>> @@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
>>>  {
>>>  	struct sparcspkr_state *state;
>>>  	struct bbc_beep_info *info;
>>> -	struct device_node *dp;
>>>  	int err = -ENOMEM;
>>>  
>>>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>>> @@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
>>>  	state->event = bbc_spkr_event;
>>>  	spin_lock_init(&state->lock);
>>>  
>>> -	dp = of_find_node_by_path("/");
>>>  	err = -ENODEV;
>>> +	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
>>>  	if (!dp)
>>>  		goto out_free;
>>
>> Sigh...  See that
>>         state = kzalloc(sizeof(*state), GFP_KERNEL);
>> 	if (!state)
>> 		goto out_err;
>> above?
>>
>> IOW, this will quietly generate broken code if built with gcc (and refuse to
>> compile with clang).  Yeah, this one is trivially fixed (return -ENOMEM instead
>> of a goto), but...
>>
>> __cleanup() can be useful, but it's really *not* safe for blind use; you
>> need to watch out for changed scopes (harmless in case of device_node)
>> and for gotos (broken here).
> 
> Hi Al Viro,
> 
> sorry, but I think I don't get you. First, I don't see sparc64 as a
> supported architecture for clang in the Linux documentation. Maybe the
> documentation is not up-to-date, but I tried to compile with clang and
> it seems to be true that it is not supported. Anyway, that is not the
> issue here.
> 
> Second, I might be missing something about the scopes you are
> mentioning. 'state' gets allocated before the device_node is declared,
> and when the device_node is declared and its initialization fails, it
> should jump to 'out_free' to free 'state', shouldn't it? Sorry if I have
> overlooked something here.
> 
> Thank your for your feedback and best regards,
> Javier Carrasco
> 


I think that the issue you are talking about is that the goto will
trigger the cleanup function of the device_node, which will not be
initialized at that point.

Yes, the goto before the device_node declaration hurts, and a return as
you said would be better.

Thanks and best regards,
Javier Carrasco
