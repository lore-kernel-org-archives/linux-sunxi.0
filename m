Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F04221DB0
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741592467; cv=none; b=kekR+rQXy7/my9jaSrI/7GFeVVN22/Ov9TDVo9NXg0STFt58xAF0wpOSWvQsjEmexsRwzhNjWXR4EizRUidQoz/YH1bGfW0dETd3MlpzBzJSEs6UvXo2hDUfhpvkO8icb+L8G73ENJjSRSSkbg9ZsJJ+Mu7JQkJuQKEPEcSXVIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741592467; c=relaxed/simple;
	bh=LTMAUQTizHw74W2gOqhgX2l8ap8D2eBxC8RTz2GImYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PClRoOW/nXoiGIjDXaw2QHVsEJA7wLCgiiGaCKz5W2c4FW0g9R+rDoJ04+qHlrL44D15m5cA46/ttVDMYRLgh+xbvLvTXi5rKlu8GuMA5RmlsyQEZlSia0JpM4mRbz4p0qEn0J/p5r+TqK0CC5nAHNBFDaoVRZhFmHWFAeAt2/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdBKL7m8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdBKL7m8"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5498c742661so4299273e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741592463; x=1742197263; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osEFHHA8j9TYONQ8F8JDSlqbUbM3s6nOsIv91QRD3Lc=;
        b=WdBKL7m8ZrEtJPEy/+IQOXAgoBulMOrrdIF+Gm+YzkKf3ufAHkE+84WpLa/CaLpD07
         /Z9YPcR4fOxWxQgS2rZXcTLHU9Sz6ydAhrEKgpbAWp/Mzxmee8IqX18IFxJ5kdLq2WC0
         7kaWfg05P9sY3t1oIuKoYMFYk14qk7VeDjW9Bo5uGniL51m4TlKOK4XWzV8cOD2wVLSa
         5OWnaE5vEIieC9r+X3KrB+kpcDhwCDzjAmNtY8gF4nbbSsqfxXxl/XkZmmjBcaRhr59p
         iY9evslcAgcIZYsQhV1vEn3YPh0j/mWg9h43Ef6/TWRQjIXlIRA84AXR9f2MqZZJcCO/
         vARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741592463; x=1742197263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osEFHHA8j9TYONQ8F8JDSlqbUbM3s6nOsIv91QRD3Lc=;
        b=kLSSV0Y0VPN3KRfYEG//dLoKyy48zGdG7MA7R92rLHtl1+lBIPsgb+a0ASEy6P0Fub
         3F2zPCAOH5v3KVLVG2gL/kLSN4sIOwntAe/QpucYPISjLTdWABPuSeDEvFftzRRtLU88
         mhRnhbGy5yfQKs3rVImvMyUkrcCNrf2eebCILIWATU1J6YCWMNuiT78ocxrI9+czRp84
         x+alkjryUJt5P0+8C/ZuMQJZ/WEFEZXXrmFjRxc8B7uMN003IUI6irG5BXVJSyKGec6a
         XBh64CoRnSRCvO9R9yv61l7piZBMVcxbvl7ONBxLrh/tvbIhHdgovkj1wERDTzBIz4eH
         ZtQw==
X-Forwarded-Encrypted: i=1; AJvYcCULzHzRYkXDc/WFg1ECfoN/0/tkp17MtdBAhNkTcivNf/cMOdFfm3UX1E+hFcb/mQqS8vM+nYQwjKUA/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyR4bjG8k1sdK6KucEpND1PrBx7pQ75MwQ9ahcjt9j8pH7DppYD
	4Zs9TxUSn4UKnd53g9A5szxaPgbfs11Et6HbPXGpuRPhgZCqImEs
X-Gm-Gg: ASbGncsd8SwtIApKU+2UefEPU6+6FMBXg7gt/UYMISNfejRb249ET125yZxcdwZLVKj
	2r4acX0Lbh0Py24S9ImL1N8ohmhV3iEZxhiMXp7iuIbTerlGFaknhoQ9ksHMyRzEIswG/BgUYrU
	Eg8EALE59iuhWHKTa9pxPm51YJR8N4vAXBXSyGxjKesKjOeRFhYkBpqKfkDLGTN0G/Px1SNPXkW
	vYxG498e83xvtJUMI03P/mpAKWNiLhngODNr7ChkHLm2X0lPvmMHnQLuv3pyE7ed5Mf3+m4y3g9
	HoBdRBg4y6qgpn1ueow0GIuBU/RCDxW35twxgdyptI0o2s0HglgnSmQYYEsfRPCwLagaS+kxJqK
	tSa0mvJtrVoQFlVQuwvLkDNoIXQ==
X-Google-Smtp-Source: AGHT+IH2xlfCjxUf0Jmc6edmxLihr/sOKf0PRYUS3gP/gGJ3W6JuFQR6v8x9TcODLg2RTjj4/+/a7A==
X-Received: by 2002:a05:6512:ba6:b0:549:8f15:db2f with SMTP id 2adb3069b0e04-54990e6771cmr4714399e87.31.1741592462737;
        Mon, 10 Mar 2025 00:41:02 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd032sm1379150e87.142.2025.03.10.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 00:41:02 -0700 (PDT)
Message-ID: <4d5212b3-3801-408c-9a5d-c6111189793c@gmail.com>
Date: Mon, 10 Mar 2025 09:41:00 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1740993491.git.mazziesaccount@gmail.com>
 <e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
 <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
 <54a031d0-df47-4baa-a23a-1a79c0922542@gmail.com>
 <20250308162928.72bd1d1b@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250308162928.72bd1d1b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/03/2025 18:29, Jonathan Cameron wrote:
> On Wed, 5 Mar 2025 12:54:33 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Thanks for the review David.
>>
>> On 04/03/2025 11:25, David Lechner wrote:
>>> On Mon, Mar 3, 2025 at 12:32 PM Matti Vaittinen
>>> <mazziesaccount@gmail.com> wrote:
>>>>
>>>> There are ADC ICs which may have some of the AIN pins usable for other
>>>> functions. These ICs may have some of the AIN pins wired so that they
>>>> should not be used for ADC.
>>>>
>>>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>>>> add corresponding channels@N nodes in the device tree as described in
>>>> the ADC binding yaml.
>>>>
>>>> Add couple of helper functions which can be used to retrieve the channel
>>>> information from the device node.
>>>>
>>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>>
>>>> ---
>>
>>>> + *
>>>> + * Return:     Number of found channels on succes. Negative value to indicate
>>>
>>> s/succes/success/
>>
>> Thanks!
>>
>>>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>>>> +                                         const struct iio_chan_spec *template,
>>>> +                                         int max_chan_id,
>>>> +                                         struct iio_chan_spec **cs)
>>>> +{
>>>> +       struct iio_chan_spec *chan_array, *chan;
>>>> +       int num_chan = 0, ret;
>>>> +
>>>> +       num_chan = iio_adc_device_num_channels(dev);
>>>> +       if (num_chan < 1)
>>>> +               return num_chan;
>>>> +
>>>> +       chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
>>>> +                                 GFP_KERNEL);
>>>> +       if (!chan_array)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       chan = &chan_array[0];
>>>> +
>>>> +       device_for_each_child_node_scoped(dev, child) {
>>>> +               u32 ch;
>>>> +
>>>> +               if (!fwnode_name_eq(child, "channel"))
>>>> +                       continue;
>>>> +
>>>> +               ret = fwnode_property_read_u32(child, "reg", &ch);
>>>> +               if (ret)
>>>> +                       return ret;
>>>> +
>>>> +               if (max_chan_id != -1 && ch > max_chan_id)
>>>> +                       return -ERANGE;
>>>> +
>>>
>>> Should we use return dev_err_probe() on these to help with debugging a bad dtb?
>>>    
>>
>> I am not fan of using dev_err_probe() in a 'library code'. This is
>> because we never know if there'll be some odd use-case where this is not
>> called from the probe.
>>
>> All in all, I'd leave adding most of the debugs to the callers -
>> especially because we do not expect to have bad device-trees after the
>> initial 'development stage' of a board. The board 'development stage'
>> should really reveal bugs which prevent the channels from being
>> registered - and after the DT is correct, these debug prints become
>> unnecessary (albeit minor) binary bloat.
>>
>>>> +               *chan = *template;
>>>> +               chan->channel = ch;
>>>> +               chan++;
>>>> +       }
>>>> +
>>>> +       *cs = chan_array;
>>>> +
>>>> +       return num_chan;
>>>> +}
>>>> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER");
>>>
>>> We can make this less verbose by setting #define
>>> DEFAULT_SYMBOL_NAMESPACE at the start of the file. Then we can just do
>>> EXPORT_SYMBOL_GPL() throughout the rest of the file.
>>
>> I am not sure what to think of this. I use the good old 'ctrl + ]' in my
>> editor when I need to check how a function was supposed to be used. That
>> jumps to the spot of code where the function is. I'd like to see the
>> namespace mentioned there in order to not accidentally miss the fact the
>> function belongs to one.
>>
>> OTOH, I do like simplifications. Yet, the added simplification might not
>> warrant the namespace not being visible in the function definition.
>>
>>> Also, I would prefer if the namespace matched config name (IIO_ADC_HELPER).
>>
>> I had some lengthy discussion about this with Andy and Jonathan during
>> earlier review versions. In short, I don't like the idea of very
>> fragmented namespaces in IIO, which will just complicate the drivers
>> without providing any obvious benefit.
>>
>> https://lore.kernel.org/all/20250222174842.57c091c5@jic23-huawei/
>>
>>>> +
>>>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>>>> +                                         const struct iio_chan_spec *template,
>>>> +                                         int max_chan_id,
>>>> +                                         struct iio_chan_spec **cs);
>>>> +
>>>
>>> There are some different opinions on this, but on the last patch I did
>>> introducing a new namespace, the consensus seems to be that putting
>>> the MODULE_IMPORT_NS() in the header file was convenient so that users
>>> of the API don't have to remember to both include the header and add
>>> the import macro.
>>>    
>>
>> I do like this suggestion, and I believe this would be the balance
>> between getting the benefit of hiding part of the symbols - while not
>> unnecessarily complicating the callers. I know some people are opposing
>> it though. My personal opinion is that having the MODULE_IMPORT_NS() in
>> a header would be neatly simplifying the calling code with very little
>> harm, especially here where including the header hardly has use-cases
>> outside the IIO ADC.
>>
>> Unfortunately, the "safety" seems to often be a synonym for just "making
>> it intentionally hard". As Finnish people say: "Kärsi, kärsi,
>> kirkkaamman kruunun saat". :)
>> (Roughly translated as "Suffer, suffer, you will get a brighter crown").
>>
>> Let's hear what Jonathan thinks of your suggestion.
> 
> For this particular case my intent was that all the IIO exports that
> are suitable for use in simple IIO drives will be in this namespace,
> we just haven't started that conversion yet.
> 
> As such, having it defined from a header for this helper isn't a good
> thing to do.

Hmm. I agree.

>  Generally I prefer to see in driver code what namespaces
> are involved but do understand the other viewpoint. In this case I
> definitely don't think it is appropriate unless we go for a specific namespace
> for just this helper.

I suppose having the MODULE_IMPORT_NS() in the header would actually 
make the more fine-grained namespaces (like IIO_ADC_HELPERS, IIO_GTS, 
...) much more usable. That'd relieved the drivers from explicitly 
listing multiple namespaces while nicely limiting the visibility.

If IIO was my territory, I might want to ask people to go with that 
approach - but I am quite happy being a freeloade.. errm, I mean, 
bystander ;)

Thanks!

Yours,
	-- Matti
