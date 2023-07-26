Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA70DBA43
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 13:52:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9859B1480;
	Wed, 26 Jul 2023 06:52:53 -0700 (PDT)
Received: from [10.32.102.67] (e110479.arm.com [10.32.102.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEE5B3F6C4;
	Wed, 26 Jul 2023 06:52:08 -0700 (PDT)
Message-ID: <1f2bdeb7-905d-594b-4729-982583e3223e@arm.com>
Date: Wed, 26 Jul 2023 14:52:00 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/20] sunxi: remove CONFIG_MACPWR
Content-Language: en-US
To: Sam Edwards <cfsworks@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-3-andre.przywara@arm.com>
 <30dd62cd-33e9-a872-fe0c-287e68c8d9ef@gmail.com>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <30dd62cd-33e9-a872-fe0c-287e68c8d9ef@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sam,


On 25/07/2023 22:21, Sam Edwards wrote:
> Hi Andre,
> 
> Series looks good so far! I'm trying to move my testing build over to it 
> now; I will report back when I've been running on it for a little bit.

Cool, thanks!

> 
> On 7/21/23 07:45, Andre Przywara wrote:
>> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
>> index 7ac50c4ae8c..2db4a2d73ca 100644
>> --- a/board/sunxi/board.c
>> +++ b/board/sunxi/board.c
>> @@ -187,7 +187,7 @@ enum env_location env_get_location(enum 
>> env_operation op, int prio)
>>   /* add board specific code here */
>>   int board_init(void)
>>   {
>> -    __maybe_unused int id_pfr1, ret, macpwr_pin;
>> +    __maybe_unused int id_pfr1, ret;
>>       gd->bd->bi_boot_params = (PHYS_SDRAM_0 + 0x100);
>> @@ -224,15 +224,6 @@ int board_init(void)
>>       if (ret)
>>           return ret;
>> -    /* strcmp() would look better, but doesn't get optimised away. */
>> -    if (CONFIG_MACPWR[0]) {
>> -        macpwr_pin = sunxi_name_to_gpio(CONFIG_MACPWR);
>> -        if (macpwr_pin >= 0) {
>> -            gpio_request(macpwr_pin, "macpwr");
>> -            gpio_direction_output(macpwr_pin, 1);
>> -        }
>> -    }
> 
> This version of your series does not include the CONFIG_SATAPWR removal 
> (is that intentional or did you miss it?) so these hunks do not apply 
> against master. I was able to cherry-pick the rc series version of the 
> CONFIG_SATAPWR removal and everything applied fine. Just thought you 
> should know!

Ah, thanks for the heads up! It's actually the first patch, but I 
apparently had an off-by-one on the git format-patch command line.
The gitlab repo has the patch:
https://source.denx.de/u-boot/custodians/u-boot-sunxi/-/commits/t113s/

I will send it separately later today.

Cheers,
Andre
