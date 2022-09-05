Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C654416
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=usGuzrS9ubnodtwABmVJAgRg7YGR0CUzYO3sitN4zns=; b=bwzM7WTmRm21bB7V6grMXAtYlx
	p3HMSWq0kB4uO5qmU62uWYQeKvypAsTTN8hN3857TJW4iuSaQps5ZyHxsCbncRVv2vIbFaVHIn5V8
	MnpOCcW7owrJhhXpHt26t8GY591IxIR1pNCTLZpKtw1HkFTldPpGmeJ2K9U/R5CUR9RDs/00Sys+j
	647FgKNf/37yFPUh47ygSO3mWasmaAIGc1u/GYR5OyyTphfXwgEBtXSy+ElyXuWolHABFviCkWljy
	scpTo4z+XIwLMILfGGtzicJx/vjVr9ZTILBKHfC1xltHgZITfjOGB4J/Kw7YE04mRSOjy0Rfzd+96
	fZRzkgDQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=50895)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oVDqn-0002hw-D9; Mon, 05 Sep 2022 17:17:25 +0200
Message-ID: <74c10e51-4034-a284-1a26-b7ba7fe45fbe@tronnes.org>
Date: Mon, 5 Sep 2022 17:17:18 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/41] drm: Analog TV Improvements
To: Maxime Ripard <maxime@cerno.tech>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 intel-gfx@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
 <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
 <20220905145729.ln675jko3aw6sgzs@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220905145729.ln675jko3aw6sgzs@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 05.09.2022 16.57, skrev Maxime Ripard:
> On Fri, Sep 02, 2022 at 01:28:16PM +0200, Noralf Trønnes wrote:
>>
>>
>> Den 01.09.2022 21.35, skrev Noralf Trønnes:
>>>
>>>
>>> I have finally found a workaround for my kernel hangs.
>>>
>>> Dom had a look at my kernel and found that the VideoCore was fine, and
>>> he said this:
>>>
>>>> That suggests cause of lockup was on arm side rather than VC side.
>>>>
>>>> But it's hard to diagnose further. Once you've had a peripheral not
>>>> respond, the AXI bus locks up and no further operations are possible.
>>>> Usual causes of this are required clocks being stopped or domains
>>>> disabled and then trying to access the hardware.
>>>>
>>>
>>> So when I got this on my 64-bit build:
>>>
>>> [  166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 -- SError
>>> [  166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G        W
>>>     5.19.0-rc6-00096-gba7973977976-dirty #1
>>> [  166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
>>> [  166.702206] Workqueue: events_freezable_power_ thermal_zone_device_check
>>> [  166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS
>>> BTYPE=--)
>>> [  166.702242] pc : regmap_mmio_read32le+0x10/0x28
>>> [  166.702261] lr : regmap_mmio_read+0x44/0x70
>>> ...
>>> [  166.702606]  bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]
>>>
>>> I wondered if that reg read was stalled due to a clock being stopped.
>>>
>>> Lo and behold, disabling runtime pm and keeping the vec clock running
>>> all the time fixed it[1].
>>>
>>> I don't know what the problem is, but at least I can now test this patchset.
>>>
>>> [1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065
>>>
>>
>> It turns out I didn't have to disable runtime pm:
>> https://gist.github.com/notro/0adcfcb12460b54e54458afe11dc8ea2
> 
> If the bcm2711_thermal IP needs that clock to be enabled, it should grab
> a reference itself, but it looks like even the device tree binding
> doesn't ask for one.
> 

The first thing I tried was to unload the bcm2711_thermal module before
running modeset and it still hung, so I don't think that's the problem.

Noralf.
