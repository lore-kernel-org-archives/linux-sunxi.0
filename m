Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC717C
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jun 2022 13:14:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id D996C3200A6D;
	Wed,  8 Jun 2022 09:14:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 08 Jun 2022 09:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1654694069; x=
	1654780469; bh=UN7QkB/KXXBhGLM2C7OqWQxWqlOOb0tn6uS3qkjBjWg=; b=G
	1TcrWSFfPAT/3YQCZXvWlEpORP8SDCtPVCTfiP9uZJYMPqR4g4Ut3Cf/IonrD2s8
	q8oOm+ftcRLzAX+wxBEYjQOczdHa9Et3pdXAQgnh70C6pgKOISd78csetRo804Ht
	6FC55vQYHQkDJx+3l97y27e94kbbNKpusYDvzBNNEmjMroY9RzlDACfmNm1felG+
	IZVEGwIqqPLol6+Wf3z/VnPTuy4g9qEZOMDQ9iZV6CEOWEEpnZzpzu0/VUa6xmWN
	CWThRmOXqn8+0UTWXUd8Ktk+DD9jSKhcRReiU6UXjV4VJjPOf3GZJFahDH+jQg48
	TjmntjWtd9IFJHNFwVOSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654694069; x=
	1654780469; bh=UN7QkB/KXXBhGLM2C7OqWQxWqlOOb0tn6uS3qkjBjWg=; b=i
	jZ0erYaRhLtsQHhMS3jPpDETcn6yaCuzAepJKJpaJgxC6Uk2InEuDvlZpmYXVdax
	u8zW0E/jWqJhvf2Ql4M42L2HfeZ3+tyqj2dlLhmsJQtQqyhcfUwgb+Y5Vw5JKhal
	Chzdh6TK8bOdCnVfjiuqk/S+an9vCEG+nIUd+j8htJqkr7IL3IPS6mhBYj2rGWKA
	UE15WP+mKdgAuBF+T4P6nzZHYOVbSjajwp4BPOrzgXdjFpvzdqdhRGjS0K+UkvqL
	ypNYl0LCdwdxXLY9CnvsHQAJ2FVmvz3fT71W9S50Yk1FoQDVIeNtbuPYGvTi3xc5
	r23/pMmNEr7Ftrr9fL8lw==
X-ME-Sender: <xms:taCgYt_ptIuoa1szw6rF8uMjR9gGf1M1tupG7Ty6Fc-ckwX75E034A>
    <xme:taCgYhsKsEkE1mCyf1tLNOR7z-Glt5fJf3-Kdvs2Qf3WRn591-sKH5nUQONRBm8mb
    Kxvx6_dlFjggQBpKQ>
X-ME-Received: <xmr:taCgYrDnTDtPGYdL28TbPOjOuOEiA-prtkNEbE7B6EDD9m5jJFIquWiT5uViPl_BjdJxzzazKqsjbQZgxbX3o2qGVmdxtdNobmE8wZLJIpFJtVnh7eGBbsJjzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedtvefhheehgfdvkeetffeludeuudehudeuvddtveelleekvedv
    uedviefhkeeuheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:taCgYhcyCtP377kXUv1eVaGntggZ3oERgFbgSvS7bwo4TjQE5ihLlw>
    <xmx:taCgYiPCz1-Ul9fjN269_ygAQs_YV__eKe5AIn1sDO9JEtbKjh4Dtg>
    <xmx:taCgYjm3C0cw5X-Ubz-o_43QqJB9ODB9lHRr-XkPDo1f5vkndeRzeQ>
    <xmx:taCgYp23RaTP6mtSw0tiSf0IohsqDaika5vA-9LpPssl2lf9rcAS_A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 09:14:28 -0400 (EDT)
Subject: Re: [PATCH] sunxi: usb: convert PHY GPIO functions to DM
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 =?UTF-8?Q?Milan_P_=2e_Stani=c4=87?= <mps@arvanta.net>,
 linux-sunxi@lists.linux.dev
References: <20220608000604.3357-1-andre.przywara@arm.com>
 <5737809a-f9e2-f325-5168-d222968a02d8@sholland.org>
 <20220608104638.27ff5c3b@donnerap.cambridge.arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <9ef704d0-fec8-d07f-76e0-c10037aa6953@sholland.org>
Date: Wed, 8 Jun 2022 08:14:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220608104638.27ff5c3b@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/8/22 4:46 AM, Andre Przywara wrote:
> On Tue, 7 Jun 2022 21:07:59 -0500
> Samuel Holland <samuel@sholland.org> wrote:
> 
> Hi,
> 
>> On 6/7/22 7:06 PM, Andre Przywara wrote:
>>> The Allwinner USB PHY driver is still using the legacy GPIO interface,
>>> which is now implemented by the DM_GPIO compat functions.
>>> Those seem to have some design flaws, as setting the direction, then
>>> later setting the value will not work, if the DM_GPIO driver is
>>> implementing set_flags.
>>>
>>> Fix this by using the dm_ version of the direct GPIO interface, which
>>> uses struct gpio_desc structs to handle requested GPIOs, and actually
>>> keeps the flags we set earlier.
>>>
>>> This fixes USB operation on boards which need to toggle the VBUS supply
>>> via a GPIO, like the Teres-I laptop or the BananaPi M2 Berry board.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> Reported-by: Milan P. Stanić <mps@arvanta.net>  
>>
>> Reviewed-by: Samuel Holland <samuel@sholland.org>
> 
> Thanks!
> 
>>
>> It looks like the other users of sunxi_name_to_gpio are unaffected because they
>> call only gpio_direction_output (sometimes repeatedly), never gpio_set_value.
> 
> Yeah, that's right, I was concerned about SATAPWR and MACPWR too, but they
> work, for the very reason you mentioned.
> But we should eventually eliminate their usage, together with
> CONFIG_USB?_VBUS_PIN, as they are only used in U-Boot proper, where we can
> rely on proper DT information now.

I have a series for converting the USB PHY driver to devicetree already, but it
has been blocked on the devicetree update renaming "usb0_*_det-gpio" to
"usb0_*_det-gpios". In fact it is still blocked on that, because the sun4i
devicetree patch was only partially applied.

I will rebase the series on top of your patch and send it soon.

Regards,
Samuel
