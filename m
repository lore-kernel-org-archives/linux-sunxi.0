Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A57F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 07:15:49 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id y14so22806524ejd.9
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 00:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEbXkjYgumEbMNDJCMiYeb4E8ig/z8v0ydSp3ING7fY=;
        b=NNFUFD4zGr+o/UKLfpGamGmPDb7vVXMgMaZI9mT7MW9KAKLxynDB2xFcyudRIdjITp
         t58i5yQXJzT5GcaYw+rCyqJPkPni+a8CLDxZUMYfXwSDMlR8RwKExDE+JgI+c4w/XNcU
         7mPAkFM0/v4OtvAOcquVB+yLa70U1D7I8URB8z6KlwsobaUv4S6QJMr8Albw2srVQQbS
         fnTk8RDGufGIr3eVn3x/O8+MYputwgHKt94EjZLkGOvFf6bqUqLGdhNfScDNkJgzwNLJ
         sc0AY9TJAQNGPTgSpQ0KY3x3Hqq/oulbWRA2A6Dz5qMkIONXrXqfbcNdW/nbZan6ilja
         M0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEbXkjYgumEbMNDJCMiYeb4E8ig/z8v0ydSp3ING7fY=;
        b=6zVeE2SWFH6H7rm9SyiQXe/sxZr6fhNKm7u3FEbrfkp64kDHkbl2YweIujnvc6/UqR
         rvS9d2s8Z8cjQV/jL9zdCOxMhN+pFN5D5jWn8FDuFXphMaw+F3ksg3nOUjy1lIrqLk2d
         Ex59KVuAXdTZn9V9oGcGFgNoppWqnc9cW//6yVxUcwVoEU1sfMhEO26giduXk1erOvkT
         u474iGtJTzLMLL+e2h53/oFj7mU4TaT50r/qPiBcUWJGxf/4ua2nC0HI5hil+N4joA/R
         rGpB2hXNa+TOzFoqJXu2yk6Axug44WvF7kxaDS3m/TCpRXCtKY0EKIji3+1R31e1g0sW
         dJLg==
X-Gm-Message-State: ACrzQf0kQlm4jT8Q1PzWSIR3tYiiHGikjjFioA+DN4rgGOPmCVTesgnQ
	umjqJVkE50jnIw9mZazTP9w=
X-Google-Smtp-Source: AMsMyM7cL4/EL5aqG1rb/QoT19+ZJLueOKMEPB/pPcUyzE4a9EWsujJ6WtOJOvWJ4z1tFVg4f4+sLA==
X-Received: by 2002:a17:907:7da6:b0:791:997e:58fc with SMTP id oz38-20020a1709077da600b00791997e58fcmr43157491ejc.385.1667718947254;
        Sun, 06 Nov 2022 00:15:47 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id p13-20020a17090653cd00b007306a4ecc9dsm1840811ejo.18.2022.11.06.00.15.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Nov 2022 00:15:46 -0700 (PDT)
Subject: Re: [BISECTED] Allwinner A33 tablet does not fully power off
To: Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 wens@csie.org
References: <9f8a0fc3-1d9a-b271-3c26-4f7373b8a3e9@gmail.com>
 <214ed3e0-5959-8fa7-8d66-196e33112cb0@sholland.org>
 <a68b44f5-fd04-4dbe-0782-1d761c42ce3f@gmail.com>
 <c1e8a25e-3fd0-ba28-67a5-6775c6ce2d6d@sholland.org>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <f02930c0-e471-b3ee-8a3c-6bb745c3ad06@gmail.com>
Date: Sun, 6 Nov 2022 09:15:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c1e8a25e-3fd0-ba28-67a5-6775c6ce2d6d@sholland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 5.11.22 г. 21:18 ч., Samuel Holland wrote:
> On 11/5/22 03:23, Ivaylo Dimitrov wrote:
>> Hi Samuel,
>>
>> On 5.11.22 г. 4:21 ч., Samuel Holland wrote:
>>> Hi Ivo,
>>>
>>> On 10/29/22 10:23, Ivaylo Dimitrov wrote:
>>>> After commit 843107498f91e57d1d4b22cd8787112726fdaeb4 (bus: sunxi-rsb:
>>>> Implement suspend/resume/shutdown callbacks) Q8 A33 tablet I have here
>>>> cannot be powered-on after power-off, it needs press-and-hold of the
>>>> power button for 10 seconds (I guess some HW assisted power down
>>>> happens) before it can be powered-on again.
>>>>
>>>> The following patch makes it behave correctly:
>>>>
>>>> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
>>>> index 60b082fe2ed0..30016d62044c 100644
>>>> --- a/drivers/bus/sunxi-rsb.c
>>>> +++ b/drivers/bus/sunxi-rsb.c
>>>> @@ -818,10 +818,7 @@ static int sunxi_rsb_remove(struct platform_device
>>>> *pdev)
>>>>
>>>>    static void sunxi_rsb_shutdown(struct platform_device *pdev)
>>>>    {
>>>> -       struct sunxi_rsb *rsb = platform_get_drvdata(pdev);
>>>> -
>>>>           pm_runtime_disable(&pdev->dev);
>>>> -       sunxi_rsb_hw_exit(rsb);
>>>>    }
>>>>
>>>>    static const struct dev_pm_ops sunxi_rsb_dev_pm_ops = {
>>>>
>>>>
>>>> I guess the issue comes from the fact that by the time 'power off'
>>>> command to the power management IC has to be send, the bus it lives on
>>>> is already down, so the device is left in semi-powered down state. Ofc
>>>> this is a wild guess, however, preventing the bus being turned off on
>>>> shutdown fixes the issue.
>>>
>>> Your guess is correct. The controller gets shut down in
>>>
>>>     kernel_power_off()
>>>       kernel_shutdown_prepare()
>>>         device_shutdown()
>>>
>>> but the PMIC communication needs to happen later in
>>>
>>>     kernel_power_off()
>>>       machine_power_off()
>>>         pm_power_off()
>>>
>>>> Please LMK if the above is the correct approach so I will send a proper
>>>> patch or something else shall be fixed.
>>>
>>> Yes, this is exactly the right approach. The whole sunxi_rsb_shutdown()
>>
>> Don't we need pm_runtime_disable() on shutdown? As IIUC, the controller
>> might be suspended and we have to resume it to put it in state to accept
>> commands later on(in pm_power_off()).
> 
> sunxi_rsb_write() takes care of resuming the controller, so the
> controller being suspended prior to pm_power_off() is fine.
> pm_runtime_disable() would actually prevent resuming the controller
> later in sunxi_rsb_write().
> 

I see.

>>> function should be removed. When you send a patch, please add a Fixes:
>>> tag referencing the commit that you bisected to.
> 
> I found a couple of other issues as well, so I'll send out some fixes
> with you CC'd.
>

Ok, thanks. What about stable kernels, poweroff is broken since 
843107498f91e57d1d4b22cd8787112726fdaeb4?

Regards,
Ivo

> Regards,
> Samuel
> 
