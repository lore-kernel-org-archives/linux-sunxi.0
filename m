Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D7415F04
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535367; cv=none; b=G9ttkcH67Tu98H4B20jLwJbOpvUbCmF07icCnHjvZVFuyoXdQUK7dNwLmNj8YC7qdl6RJ0he4GSRgGk8Y3WtOPYbVIllBI8forxn1VXNhpwTqshKsM87L/TBbW3PIpFb8wPMBFgtfDYhpADYzyvU9uq/F3zLm10fgb5siJqNc38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535367; c=relaxed/simple;
	bh=nxvL0AK6niVXMz1Fn/ec2Ck1XXsRkMZvaVNGXb65JMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rfIXGgIvx9HgeMc/gY2wrWdkgzwqA4qeA/ewUfBSeU450wLYyz9HgTccKU4SMGXKxXJmRzCb5+DqvsG1ju/IKvxeY04HPXyctWdrWG18du6FDsdeeX6M22x46gVSJb/AN/GhcTzYZviRH8rjhhh2kjggohvSllfokKEUfTaiUJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqtLTZSy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRF+o/X9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqtLTZSy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRF+o/X9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4HWu569236
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 11:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3hQKhgDiWny7vxdESXleC4boEjiTAY24LazqRntx8A=; b=iqtLTZSyV0QTcKzC
	DMRJumJbXlMmY8D1MKoc7V+HgfsXCYzwlr3rdUd4THZPaSKbaDPuO+FXDqo8FsZu
	0vmVn7zyCeDh6lSOe6QSp/1QEJ1wi9bUlxBGLz0hGuXb155PEWfv0wy5yVWaIses
	EXi/frQWfLoHPYWTjcKbKJkmFMqyyNYxVz13cfCrvPuZ08rZGtzKH367fN/Jx0bg
	xiu/zACbURqbHENZhB+5Axh0+rGaLI6fXu1Fjqw2wTVZYt9MDdVkpN6c/hiJFIQZ
	ZMBroXUhbZ6XJka5C4mbwSlIsoym4zoHmFymZzliXh1wFW1qCFlUlWR8CpVUlMJ4
	xw5Dhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut8kp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 11:49:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso8771721cf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786535364; x=1787140164; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3hQKhgDiWny7vxdESXleC4boEjiTAY24LazqRntx8A=;
        b=ZRF+o/X9qFghx1O/FEMjnVIYPIXM7RV7/wjCCpGo/g53Puoyxxcd3ZH2vxmDFAhJLb
         iI4J8Oa0+lP7PfvMXVcW2SWVW6IhCCtri2ZhoHLIjJ/g7fynxCdapy+BA6SEc8q0nA7u
         CruhQ9Xag2nGTjD9CiHATEh6r99N4yre5c8mw1NAlia86B8WQwzrzxPlYTDKU8jSHWzU
         B8AkiePqiZb/FWBc8TKHG4Ht3TeA5vHLWxLLjK3gL1T0L4/tVNGpPSGh7/eoH4PEsHQn
         i7X5GZMUEBbUqvOl5PS2Kra/5k8JIUWHbUEyvcm/q2z07vK1GQlpyQWOU26LSyOzTtyg
         S+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535364; x=1787140164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3hQKhgDiWny7vxdESXleC4boEjiTAY24LazqRntx8A=;
        b=HWR/t+mmZWcKIxeMta2+8ca6ZnhsW4ZXcF4iin/gl7eNxdgwFiex52xikT+V2Ywj0f
         dLdYhQ+vQj9H45yNnzWJzfljYocv5KNFMHjPnV7Hl42R51JMh/f8RN/RDaSOfe3KuemO
         8zbcaZKPd2ximnYICgmPjHopWmFty9VvLGA39lMaOwbdg6B2Xz/k56ADbn/3vGQ+29ny
         Xtsrj09yFrh8+7Ns0A4aVm7KfEgUEUo0UJ9HuC3xrJPVuENlUxlyji8aOdQz374m7/ls
         eXOVNdJeMpUHzNda5k7t/khCOm19GgpHAKcnQ4mlmaGiU7XRR2ru/n8fft5a5iJV7p25
         LlNw==
X-Forwarded-Encrypted: i=1; AHgh+RoJVSJLgyKDPPFNb0I6Khbd/MTQjAfFeNHFGRXI9oVxvmbLyw7S8fVhfNruGL2kfI+u9On5DldNQyURkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZQR0xDc+DxqDcPv7AGOwvUTpOyUtolm1idrj88VKsF5XwSb9k
	r1oGmfq9DCV1OFI9QtSrvIcncShfXmbX9S6yTMaWsYSCQapyVStF2xxMAjdPxMUHMcXOGUulw3f
	o9h/ic6CDldQG9tJmiuETMWo0283R2qqGq11z4BLmGObcm/abtr3Ack8tcRh9Ynn5qQ==
X-Gm-Gg: AR+sD13AE8ZIjMAdz9SjgMnJToLk6FeysncMnag7Q0yx1I2mEvZ5KKYEp5+rbkd9zHX
	jjGbVo/AK0qhSgcmKx01PyuhH82OdKy/q37J+ugghubAGXJFJtOuBMKtR3gzDbEGQIGtLHzJsqZ
	kndFs+aiK5ssPMaj0ubyA414Y1UPWwfhBTvvEQtUCnXsOZQ2vO3ITRc1G6iSJESlT0uZSysWXaI
	HrMBRimZ7H1vbkv/g5rMhnun0Rxmr1Zkow/Z2ZAhQprbkpVdUNuLCnatd4hjaAgBAAoXLi9Y7L5
	JvgDfR9Zpa6z7Ui+ewaayq2ERZ3H3+FGTSu5bBBqWYd/YabJZDO7ISfGeGQzmtS4EJLwUZ23Jjt
	IvZCYWAACMdNugR8MDUDVM45fP8buEc19wHBoCNTkxc9aabrf1GKGr8PgfilXQPQ=
X-Received: by 2002:a05:622a:350:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52d6473a1b8mr32496941cf.17.1786535364358;
        Wed, 12 Aug 2026 04:49:24 -0700 (PDT)
X-Received: by 2002:a05:622a:350:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52d6473a1b8mr32496521cf.17.1786535363881;
        Wed, 12 Aug 2026 04:49:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d71e:6d83:9df1:6316? ([2a05:6e02:1041:c10:d71e:6d83:9df1:6316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm64004465e9.2.2026.08.12.04.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:49:21 -0700 (PDT)
Message-ID: <9fb18d37-0406-46e6-8552-fb925dc14fad@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 13:49:18 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload before
 CTRL write
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
References: <20260725113341.2250687-1-megi@xff.cz>
 <9e9003b7-0331-4b37-9b06-5e9de887199e@oss.qualcomm.com>
 <hrm7ymjfylkhaijaxjvornxakhoss5tea6pfmt2y2jpn436lhu@2cchvasiv4mr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <hrm7ymjfylkhaijaxjvornxakhoss5tea6pfmt2y2jpn436lhu@2cchvasiv4mr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfX0c5PfOv95cth
 9bAg25XjcQWiAZ4SOPNu6Bl5Nn/Nx3CbWm4zijljrtzDbjbX+LToggQIF4SNmkAjWTmSWxBtJeu
 TSp6wAm++CK8FObQsl9Y1shXB2b6fPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfXzzD21K8mrGIS
 dLOcT0ZhkBNNxyZ45t8sghdfZ0cUUXmLXrngylfI2Ah3lS4YSai3kW07qKJE4jqLwPDq6PPlsnG
 g6huOGqXrtraE1aY39jA7CuQjYM21AALJdaXLm60G1tYzXkwVMJIhT2mkWz1tUo83bRrEbF0zFW
 p2fGg4Yg7le9vTGBYFXRDztlLN7FlRo2Z4UqgumcI6t2s2xQ4YPexFTIdBa29zNok8k2eGlQiK/
 VLptaAwk7wBzlghqB5nn0N7Y6g/WBa2NJ9abu1V32WWJGEhuj+U5SVLKm14ugFubokrrS1cJs7I
 8hcUzExwDx/BFELE98FmVWw+Y5JFu3K8UW5H84lEv7Wgv2YA5zMTb8Tce1QcZg8FC4QJUmwn2au
 cnkJCMUGzsao6kYawm4Yo5hIUrzg+7mgwaszeLCalQYgEzmClNcllz3KoCHcyrmaVTkOdpgR4p5
 LBKh58CuSvRl/13rWlQ==
X-Proofpoint-ORIG-GUID: RZRln_zE-J2KjZicQEVpQEmc0czTDezO
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c5dc5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=SbrujaV1hovVMzGLTeQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: RZRln_zE-J2KjZicQEVpQEmc0czTDezO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120095

On 8/12/26 13:09, Ondřej Jirman wrote:
> Hello Daniel,
> 
> On Wed, Aug 12, 2026 at 11:56:03AM +0200, Daniel Lezcano wrote:
>> On 7/25/26 13:33, Ondřej Jirman wrote:
>>> From: Ondrej Jirman <megi@xff.cz>
>>>
>>> The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
>>> written again before it's cleared automatically."  Both time_stop() and
>>> time_start() read-modify-write the control register, so a reload still in
>>> flight gets rewritten and the write can be dropped, leaving the timer
>>> unarmed.  In oneshot mode this happens on every tick, and the tick
>>> eventually stops for good.
>>>
>>> Wait for the reload to clear first.  All control register updates go
>>> through sun4i_clkevt_time_stop().
>>>
>>> Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
>>> scheduling processes during boot or within a few seconds of executing
>>> userspace. Only sysrq+t over serial port works at this stage, which is
>>> how I discovered the root cause.
>>>
>>> Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
>>> Signed-off-by: Ondrej Jirman <megi@xff.cz>
>>> ---
>>> BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
>>> device that would exercise it. And it's possible that this triggers more easily
>>> with CONFIG_HZ=1000 which I use.
>>>
>>>    drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
>>> index 7bdcc60ad43c..2e7457f671c4 100644
>>> --- a/drivers/clocksource/timer-sun4i.c
>>> +++ b/drivers/clocksource/timer-sun4i.c
>>> @@ -39,6 +39,9 @@
>>>    #define TIMER_SYNC_TICKS	3
>>> +/* The reload bit clears a couple of source clock cycles after it is set. */
>>> +#define TIMER_RELOAD_MAX_POLL	100
>>> +
>>>    /*
>>>     * When we disable a timer, we need to wait at least for 2 cycles of
>>>     * the timer source clock. We will use for that the clocksource timer
>>> @@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
>>>    		cpu_relax();
>>>    }
>>> +/*
>>> + * The control register must not be written while a reload is still in
>>> + * flight, or the write can be dropped.
>>> + */
>>> +static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
>>> +{
>>> +	int i;
>>> +
>>> +	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
>>> +		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
>>> +			return 0;
>>> +		cpu_relax();
>>> +	}
>>
>> The loop looks correct but I'm wondering why not use the helper:
>>
>> ret = readl_poll_timeout_atomic(base + TIMER_CTL_REG(timer), val,
>> 				!(val & TIMER_CTL_RELOAD), 0, timeout);
>>
> 
> I can. The only difference would be that this would loop up to 1000 * timeout
> times, instead of 100 times in case reload bit never returns to 0. But that
> never happens anyway.

Sorry I don't get the 1000 * timeout

Does the documentation says anything about the duration before the 
register is cleared ?

>>> +	return -ETIME;
>>> +}
>>> +
>>>    static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
>>>    {
>>> -	u32 val = readl(base + TIMER_CTL_REG(timer));
>>> +	u32 val;
>>> +
>>> +	sun4i_clkevt_wait_reload(base, timer);
>>
>> If it fails ?
> 
> There's not much to do, since sun4i_clkevt_time_stop() does not return anything
> anyway and it's used across the file quite extensively. Well, the file is small,
> but sun4i_clkevt_time_stop is called in every function exported via timer_of
> struct... :)
> 
> I can rewrite all these functions to report all errors to timer core, but in
> practice reload always resets very quickly, and a condition where the loop even
> loops happens once every few seconds or so. I doubt anything but return 0
> would ever happen anyway. I'd certainly notice, because it would again cause
> instant lockup of my e-reader. Maybe I can just return void from
> sun4i_clkevt_wait_reload() and not pretend there are errors to report,
> instead?
IMO, returning void is fine along with a message, may be a WARN as it is 
really, AFAIU, not supposed to happen. It will be easy for anyone to 
find out where the issue is coming from

