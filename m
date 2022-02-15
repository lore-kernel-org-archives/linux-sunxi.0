Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9141876
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 22:20:31 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 4so526103oil.11
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 14:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=2hyLYY/9CO/wVhWB7AE8Q57o5/lHt5eUv9NzNWu5etA=;
        b=j073+6uT4bCWKaCWdn0ZEGdKfx8CH1mmniSQlGcophbCup4Dkhem4rYJpX8b4mV3yq
         lsOd2Nfn47obTfMZ37fc6C3pbx2KyaiEvPyr8OyFiipnqi1zSRXGTLEi+x1XtR6jC3UW
         VBak3Rp9kXXt9qatbFAKxHHkZIkwVXKTSsV+akJRfkZRDMSaUKlnIE/iWOOXJYYksI63
         xXqhp10N4F3offX+nbi/o/kcoZ7xhWVQKZWTgBjEtC5rzB/F2BoeyUOa65DrV/u/0Bva
         86e3PJm70F4wCst9vbiaQTEVQlkm8K4RfY5Knj5I0855BpjIvasYUJxGIREfraoJeIOM
         WNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=2hyLYY/9CO/wVhWB7AE8Q57o5/lHt5eUv9NzNWu5etA=;
        b=1MewLEnIqVTI2/G9O6/sBBJmoUyipkJkPl4xdpMDARaiQ5R0sJTSLXJ27aZ2T4TioV
         onDM3KD1MNP1336Q/TOU4zTqyCdiqgIYAE8d9iBfMkrqKWuVDnFs7WMJJf13mpu2ptkn
         Qy7CtP5LQort48zBYzQf1/+cOj9ykLrJolakYvZrqAdtDkLyli71fappAuRmJ2rr9PZu
         NRwr8S16JnOfIMDQ/BsEfNPf8WyTAS8HQWLM/LOwgMCicw4nzhm32M4OExZg7rUKB+51
         QEC2bWprAKR/YhQPEMM2fWwfzCRKNP3fl6gvaeArv+uSKOc/jWveY4CdDTxg2IY/+Fza
         /d5Q==
X-Gm-Message-State: AOAM533hPbG3+aSJkfC/Wsa2FtZwE9sSJnsecEq5lfqH8iFdBVy/WVg7
	GB/SCXds/hrklOoKquEONNY=
X-Google-Smtp-Source: ABdhPJz95t5LD4ag8s8W3zf7nTAMaI+/hXOYnfxQfY393grA4mv8EaA07EnbSTppp7NS7SI5yzRQbg==
X-Received: by 2002:a05:6808:11cf:b0:2ce:6ee7:2cf7 with SMTP id p15-20020a05680811cf00b002ce6ee72cf7mr2659568oiv.293.1644963631099;
        Tue, 15 Feb 2022 14:20:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q11sm14481431oti.3.2022.02.15.14.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 14:20:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <23df0d53-d530-2363-09c9-5be2b2306a81@roeck-us.net>
Date: Tue, 15 Feb 2022 14:20:27 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Klein <michael@fossekall.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20211129165510.370717-1-jernej.skrabec@gmail.com>
 <20220215002732.GA3215504@roeck-us.net> <4714494.31r3eYUQgx@kista>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Adjust power key nodes
In-Reply-To: <4714494.31r3eYUQgx@kista>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/15/22 12:34, Jernej Škrabec wrote:
> Hi!
> 
> Dne torek, 15. februar 2022 ob 01:27:32 CET je Guenter Roeck napisal(a):
>> Hi,
>>
>> On Mon, Nov 29, 2021 at 05:55:10PM +0100, Jernej Skrabec wrote:
>>> Several H3 and one H2+ board have power key nodes, which are slightly
>>> off. Some are missing wakeup-source property and some have BTN_0 code
>>> assigned instead of KEY_POWER.
>>>
>>> Adjust them, so they can function as intended by designer.
>>>
>>> Co-developed-by: Michael Klein <michael@fossekall.de>
>>> Signed-off-by: Michael Klein <michael@fossekall.de>
>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>>
>> This patch results in the following traceback when rebooting an
>> orangepi-pc qemu emulation.
>>
>> [   30.899594]
>> [   30.899685] ============================================
>> [   30.899757] WARNING: possible recursive locking detected
>> [   30.899938] 5.17.0-rc3-00394-gc849047c2473 #1 Not tainted
>> [   30.900055] --------------------------------------------
>> [   30.900124] init/307 is trying to acquire lock:
>> [   30.900246] c2dfe27c (&irq_desc_lock_class){-.-.}-{2:2}, at:
> __irq_get_desc_lock+0x58/0xa0
>> [   30.900900]
>> [   30.900900] but task is already holding lock:
>> [   30.900974] c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at:
> __irq_get_desc_lock+0x58/0xa0
>> [   30.901101]
>> [   30.901101] other info that might help us debug this:
>> [   30.901188]  Possible unsafe locking scenario:
>> [   30.901188]
>> [   30.901262]        CPU0
>> [   30.901301]        ----
>> [   30.901339]   lock(&irq_desc_lock_class);
>> [   30.901411]   lock(&irq_desc_lock_class);
>> [   30.901480]
>> [   30.901480]  *** DEADLOCK ***
>> [   30.901480]
>> [   30.901554]  May be due to missing lock nesting notation
>> [   30.901554]
>> [   30.901657] 4 locks held by init/307:
>> [   30.901724]  #0: c1f29f18 (system_transition_mutex){+.+.}-{3:3}, at:
> __do_sys_reboot+0x90/0x23c
>> [   30.901889]  #1: c20f7760 (&dev->mutex){....}-{3:3}, at:
> device_shutdown+0xf4/0x224
>> [   30.902016]  #2: c2e804d8 (&dev->mutex){....}-{3:3}, at:
> device_shutdown+0x104/0x224
>> [   30.902138]  #3: c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at:
> __irq_get_desc_lock+0x58/0xa0
>> [   30.902281]
>> [   30.902281] stack backtrace:
>> [   30.902462] CPU: 0 PID: 307 Comm: init Not tainted 5.17.0-rc3-00394-
> gc849047c2473 #1
>> [   30.902572] Hardware name: Allwinner sun8i Family
>> [   30.902781]  unwind_backtrace from show_stack+0x10/0x14
>> [   30.902895]  show_stack from dump_stack_lvl+0x68/0x90
>> [   30.902970]  dump_stack_lvl from __lock_acquire+0x1680/0x31a0
>> [   30.903047]  __lock_acquire from lock_acquire+0x148/0x3dc
>> [   30.903118]  lock_acquire from _raw_spin_lock_irqsave+0x50/0x6c
>> [   30.903197]  _raw_spin_lock_irqsave from __irq_get_desc_lock+0x58/0xa0
>> [   30.903282]  __irq_get_desc_lock from irq_set_irq_wake+0x2c/0x19c
>> [   30.903366]  irq_set_irq_wake from irq_set_irq_wake+0x13c/0x19c
>> [   30.903442]  irq_set_irq_wake from gpio_keys_suspend+0x80/0x1a4
>> [   30.903523]  gpio_keys_suspend from gpio_keys_shutdown+0x10/0x2c
>> [   30.903603]  gpio_keys_shutdown from device_shutdown+0x180/0x224
>> [   30.903685]  device_shutdown from __do_sys_reboot+0x134/0x23c
>> [   30.903764]  __do_sys_reboot from ret_fast_syscall+0x0/0x1c
>> [   30.903894] Exception stack(0xc584ffa8 to 0xc584fff0)
>> [   30.904013] ffa0:                   01234567 000c623f fee1dead 28121969
> 01234567 00000000
>> [   30.904117] ffc0: 01234567 000c623f 00000001 00000058 000d85c0 00000000
> 00000000 00000000
>> [   30.904213] ffe0: 000d8298 be84ddf4 000918bc b6eb0edc
>> [   30.905189] reboot: Restarting system
>>
>> The warning is no longer seen after reverting this patch.
>>
>> The problem exists but is not seen in v5.17-rc4 because a bug in commit
>> 8df89a7cbc63 ("pinctrl-sunxi: don't call pinctrl_gpio_direction()")
>> hides it. That problem is fixed with commit 3c5412cdec9f ("pinctrl-sunxi:
>> sunxi_pinctrl_gpio_direction_in/output: use correct offset") in linux-next,
>> and the traceback is seen there.
> 
> Hm... These DT changes were tested with many users on older kernels for some
> time now and new properties conform to bindings. Should we revert pinctrl
> changes?
> 

I don't think those changes were tested with orangepi-pc on real hardware.
Maybe I didn't explain it clearly enough: Commit 8df89a7cbc63 does _not_
introduce the problem. It hides the problem. Reverting commit 8df89a7cbc63
won't help but result in exactly the same backtrace (I tried).

Some more details: This commit introduces "wakeup-source;" to various
orangepi-pc nodes. This triggers in a call to sunxi_pinctrl_irq_set_wake(),
which did not happen before and which may result in the traceback.

Guenter
