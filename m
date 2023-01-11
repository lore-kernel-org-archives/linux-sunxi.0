Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6F17D0
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Jan 2023 15:30:56 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id v25so24043000lfe.12
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Jan 2023 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qbu6KqoFVUP3hpnWPUahg6+pfccNp1XMgcyJhxL3sHQ=;
        b=piJ6AR/7mwIv5ssf0bPeGI/y1HfticwRpnHpKDxpJJOmyFI9+Fcte6qtWkH0I2fOxf
         xTYmiVIlFySN2KbqHCXqxzBIxc6/2nlxu2+ixkY3fDhe2OFDyngzekiuLGrNcgW/Xsu1
         xqJdTvSzEIrHX7Hx9YvafGHvvBa4vY2qsZ3b1McEzW5tmaA8Nw9+yNGHiBd8I4QF/H0L
         PLkaIsFKD8tt7+XUYZ4Z0Jp/RHCbQ3m0OkeG8mkPs1ENMKkoMw8SGGYL4Yuyp+dMY28h
         Jcy4hVLz8OdUGwq9wRNwLttaNd4at+MPk+3V1lPBjbBePveIBaxuDRkGijEMOSgYcWva
         gHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbu6KqoFVUP3hpnWPUahg6+pfccNp1XMgcyJhxL3sHQ=;
        b=We5JEOL7Ccn74hRe+ehzTggFt0TPZwafgje3hoOtiQrOrtciXuLGk1qQXr3wJmb9lb
         E/eRJTIz6Qq8Gjn6JgyYg++nJI8I59HO9X9AcbrMhRWTiajhp/hMfMr11gFy2T0J4ZCP
         LCXEwnHS3IiVxnEdiRTX/lTobD1R23Bj6KM36BGG+wwnvZ7ZPzM5aBhGL25/knJeP4pN
         DTMQZk7SOjm5O92m6RFWSZWHZqr/Q+t4gFLKchWAQvtU5vm9hD9RzxBtJpWyT892iTkm
         BhZEoNMIfLRczV6CbvRCm+Iit5dt8IMOrE4RMqaYtx1+f0qG+YqS/By9mLCbQe0UwWzj
         fmug==
X-Gm-Message-State: AFqh2kru2D0ejoBOFnJfQkpf/rQ3sbpEmPApASZ/YC4CjKWwOsPAVbAS
	4QPHE40lCPAwgCOXaJmnTEAwGQ==
X-Google-Smtp-Source: AMrXdXsJsrNv/JojgqdyGM2htDPuCMqWkk3bmrHNobr84SP2C7Wa10a79dDgSHhARO48zeWm2i9u1A==
X-Received: by 2002:ac2:495b:0:b0:4b5:6755:4226 with SMTP id o27-20020ac2495b000000b004b567554226mr19619019lfi.55.1673451054761;
        Wed, 11 Jan 2023 07:30:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v23-20020ac258f7000000b004cb00bf6724sm2779947lfo.143.2023.01.11.07.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:30:54 -0800 (PST)
Message-ID: <88faa612-e7a0-24b8-aba8-4a42919402ec@linaro.org>
Date: Wed, 11 Jan 2023 17:30:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/16] of: device: make of_device_uevent_modalias()
 take a const device *
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Frank Rowand <frowand.list@gmail.com>, Liang He <windhl@126.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, Lyude Paul <lyude@redhat.com>,
 Corentin Labbe <clabbe@baylibre.com>, Zou Wei <zou_wei@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-2-gregkh@linuxfoundation.org>
 <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
 <Y77VDGvHGu8gDIga@kroah.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y77VDGvHGu8gDIga@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2023 17:26, Greg Kroah-Hartman wrote:
> On Wed, Jan 11, 2023 at 08:54:04AM -0600, Rob Herring wrote:
>> On Wed, Jan 11, 2023 at 5:30 AM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> of_device_uevent_modalias() does not modify the device pointer passed to
>>> it, so mark it constant.  In order to properly do this, a number of
>>> busses need to have a modalias function added as they were attempting to
>>> just point to of_device_uevent_modalias instead of their bus-specific
>>> modalias function.  This is fine except if the prototype for a bus and
>>> device type modalias function diverges and then problems could happen.  To
>>> prevent all of that, just wrap the call to of_device_uevent_modalias()
>>> directly for each bus and device type individually.
>>
>> Why not just put the wrapper function in the DT code instead of making
>> 4 copies of it?
> 
> I could, if you think that it would be better there instead of in each
> individual bus (like all of the other bus callbacks).  This way each bus
> "owns" their implementation :)



I'd vote for the generic wrapper instead of 4 similar wrapper. In the 
end, if of_device_uevent_modalias (or the bus callback) interface 
changes again for whatever reasons, there will be just a single place to 
fix rather than fixing 4 (or more) bus drivers.
-- 
With best wishes
Dmitry

