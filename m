Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957361E3780
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035588; cv=none; b=VFlOp8j+r7DSaoDoVTLbaPT+ar5RBFNSryX3I6rIKQM0PtQdFfrJOp/Kkb4fleM8LuI0OmJaHOSIJClJX5reNDc45ARiEhK1CMC4PmuWRsUgpIyrerlGJH5psJqfJebqIMSTXYOL6o63Iny1oVODz+Lc2NKUsHOpNAlSUIiN7o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035588; c=relaxed/simple;
	bh=PJgSIw9XkHYZLj89vwvjA1zq1i+3FNHoBiCWYf6Ow9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=df5qOY9MPSTykHLhqQzdF5FighzGaDQqWKigBg1VFazfXkLaJE25iWh4EPoO1qSkLlIC7CzbVZEauAjRsjPI+lDdHBThRKi+knmiqbI5jt/my8r028jJavE9tJr6ElFTcYAbr1ffXyy4D7JseL7Vj+wsWoqW9Xpjguf1GwWqwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrsGypgM; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrsGypgM"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3072f8dc069so5534461fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 23:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740035584; x=1740640384; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GAX2Ms3C+1iFEiEooYALMC1zyJP6nScc6k91Dyj8T4=;
        b=TrsGypgMNIeERhqj6mneK7gClbP1tRa3RQ2Mfhdfw6raLkfSbmoV47bK9PpCNCzXmE
         GCimambxYSkZELhJOvpJ0SzMOcyyO72jQ7VtDhaniGYp9hARHnRoWyKCCRUFTMy9SGI1
         aAG7Yh9+lnJWDH2fHY8lNZDV4xzdXpLNUNJpmMqEIG0w0tX/R1QxQovlo3C3Q59MpNc5
         wcrM943qT3ZGlw618InafHF55eK8MxNfZmpLK1WW51cwApILZNab1q9SpnHPdzT9NfRw
         FLpPut2ZwRcW09e0xGslzd+vQUaK0rEVwg1cweB0VqZ8dZ7uFHlWNjfqQ9H72ng0/Uhk
         gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740035584; x=1740640384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GAX2Ms3C+1iFEiEooYALMC1zyJP6nScc6k91Dyj8T4=;
        b=LDw0NiMd6Ga7GWv86HD4rd+1jC4907sfZ7/hqZSenO+dnmrmUY+bkFSbH/aGJkkQJt
         +6R6pp3tvBUwGBXR2kN2co3GwKKyIM+g2wGoyxojCqnoopxkq8e5lRbwVSlf4MNzuH8X
         C4VXzROxpgTmV9/lI2F5EBEH5fiHq4lvaHuoDErxivk+gwMBcLYsHnJbIuHz/2+cQ00O
         AUd3F6gdD3aRTArAU1zf2qxlfHON6tHE/2gE+Q6sldINDfpSi2024Pv61BztBE3Z8LR6
         xjnwfzI/JbpyLeUa9aYjy68imsEB+xTJ81dwPDFvYMEtF9N1ESVNPoT+A2OkyhrKVH1j
         EJIg==
X-Forwarded-Encrypted: i=1; AJvYcCVugJSuKQH2WiOWRv0iYeKyPma1r8cirHf4Wjsf0WhXyurIg13V6HiVmPIFOISDeuaSJxiztp0Vv9ZoyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxLm10OlPqHar6BFxjEREtNS7sKTKQomEtpumgkIhaF2ZaHLh0
	JDHNY2y76jAJHR+t/B0gJ4q4zpPeY1HsNUD4FDlzcJVlN4+8KLUY
X-Gm-Gg: ASbGncvWNtJ4d0/mTFu7HGGDNwm7arWqKAo6VRby2QIErb6tZL6d+jCUsUmQyce7RAm
	6vFirOULCHHQpyMqcDILZmr3CDSrmRr9HXQSDo3sjSqh6+ApbxlmTxXu7nMVKe1qWza7QsD3ppU
	vGTHgGaqd1Z/TfzizfyAOa8gr/om85pn7diQlHfORaBGmfMVqd6P0PKx3k1ADfHmeJnJymsT/3L
	sdQZmu5ycdvCq4//4aInMlqu0TH2YJ4GQzKWdHIBfvLxB9JwdmKNJ8QCKaPW22n46I/3whPZxop
	nj3FposnCWGij769+M+ewHPEpb5WeBo7VcNLJf5fp233YB80sUiEklEbrDFrpS60QZB8XIaV
X-Google-Smtp-Source: AGHT+IFKp9trN/cn2Qm66dYQMf1hABQUmyHBmZFJ75NYzdUOuFn45L/HlCdjW3lLCknW0qJmzNb4EQ==
X-Received: by 2002:a2e:8650:0:b0:308:f479:5696 with SMTP id 38308e7fff4ca-30a44dc4ff1mr17598221fa.15.1740035583979;
        Wed, 19 Feb 2025 23:13:03 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30921447bdcsm21379171fa.35.2025.02.19.23.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 23:13:03 -0800 (PST)
Message-ID: <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
Date: Thu, 20 Feb 2025 09:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] iio: adc: add helpers for parsing ADC nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <6c5b678526e227488592d004c315a967b9809701.1739967040.git.mazziesaccount@gmail.com>
 <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andy,

Long time no hear ;) First of all, thanks for the review!

On 19/02/2025 22:41, Andy Shevchenko wrote:
> On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
> 
> ...
> 
>>   - Rename iio_adc_device_get_channels() as
> 
> as?

Oh, looks like I got interrupted :) Thanks!

> 
> ...
> 
>> obj-$(CONFIG_FSL_MX25_ADC) += fsl-imx25-gcq.o
>>   obj-$(CONFIG_GEHC_PMC_ADC) += gehc-pmc-adc.o
>>   obj-$(CONFIG_HI8435) += hi8435.o
>>   obj-$(CONFIG_HX711) += hx711.o
> 
>> +obj-$(CONFIG_IIO_ADC_HELPER) += industrialio-adc.o
> 
> Shouldn't this be grouped with other IIO core related objects?

I was unsure where to put this. The 'adc' subfolder contained no other 
IIO core files, so there really was no group. I did consider putting it 
on top of the file but then just decided to go with the alphabetical 
order. Not sure what is the right way though.

>>   obj-$(CONFIG_IMX7D_ADC) += imx7d_adc.o
>>   obj-$(CONFIG_IMX8QXP_ADC) += imx8qxp-adc.o
>>   obj-$(CONFIG_IMX93_ADC) += imx93_adc.o
> 
> ...
> 
> 
> + bitops.h
> 
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
> 
> + export.h
> 
> + module.h
> 
>> +#include <linux/property.h>
> 
> + types.h

Thanks!

> ...
> 
>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> 
> No namespace?

I was considering also this. The IIO core functions don't belong into a 
namespace - so I followed the convention to keep these similar to other 
IIO core stuff.

(Sometimes I have a feeling that the trend today is to try make things 
intentionally difficult in the name of the safety. Like, "more difficult 
I make this, more experience points I gain in the name of the safety".)

Well, I suppose I could add a namespace for these functions - if this 
approach stays - but I'd really prefer having all IIO core stuff in some 
global IIO namespace and not to have dozens of fine-grained namespaces 
for an IIO driver to use...

> ...
> 
>> +	if (!allowed_types || allowed_types & (~IIO_ADC_CHAN_PROP_TYPE_ALL)) {
> 
> Unneeded parentheses around negated value.
> 
>> +		dev_dbg(dev, "Invalid adc allowed prop types 0x%lx\n",
>> +			allowed_types);
>> +
>> +		return -EINVAL;
>> +	}
>> +	if (found_types & (~allowed_types)) {
> 
> Ditto.
> 
>> +		long unknown_types = found_types & (~allowed_types);
> 
> Ditto and so on...
> 
> Where did you get this style from? I think I see it first time in your
> contributions. Is it a new preferences? Why?

Last autumn I found out my house was damaged by water. I had to empty 
half of the rooms and finally move out for 2.5 months. Now I'm finally 
back, but during the moves I lost my printed list of operator 
precedences which I used to have on my desk. I've been writing C for 25 
years or so, and I still don't remember the precedence rules for all 
bitwise operations - and I am fairly convinced I am not the only one.

What I understood is that I don't really have to have a printed list at 
home, or go googling when away from home. I can just make it very, very 
obvious :) Helps me a lot.

> 
>> +		int type;
>> +
>> +		for_each_set_bit(type, &unknown_types,
>> +				 IIO_ADC_CHAN_NUM_PROP_TYPES - 1) {
>> +			dev_err(dev, "Unsupported channel property %s\n",
>> +				iio_adc_type2prop(type));
>> +		}
>> +
>> +		return -EINVAL;
>> +	}
> 
> ...
> 
>> +int iio_adc_device_channels_by_property(struct device *dev, int *channels,
>> +		int max_channels, const struct iio_adc_props *expected_props)
>> +{
>> +	int num_chan = 0, ret;
>> +
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		u32 ch, diff[2], se;
>> +		struct iio_adc_props tmp;
>> +		int chtypes_found = 0;
>> +
>> +		if (!fwnode_name_eq(child, "channel"))
>> +			continue;
>> +
>> +		if (num_chan == max_channels)
>> +			return -EINVAL;
>> +
>> +		ret = fwnode_property_read_u32(child, "reg", &ch);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = fwnode_property_read_u32_array(child, "diff-channels",
>> +						     &diff[0], 2);
> 
> 						     diff, ARRAY_SIZE(diff));
> 
> (will require array_size.h)

thanks :) And thanks for being helpful with the header - and there is no 
sarcasm!

>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_DIFF;
>> +
>> +		ret = fwnode_property_read_u32(child, "single-channel", &se);
>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED;
>> +
>> +		tmp = *expected_props;
>> +		/*
>> +		 * We don't bother reading the "common-mode-channel" here as it
>> +		 * doesn't really affect on the primary channel ID. We remove
>> +		 * it from the required properties to allow the sanity check
>> +		 * pass here  also for drivers which require it.
>> +		 */
>> +		tmp.required &= (~BIT(IIO_ADC_CHAN_PROP_COMMON));
> 
> Redundant outer parentheses. What's the point, please?

Zero need to think of precedence.

>> +		ret = iio_adc_prop_type_check_sanity(dev, &tmp, chtypes_found);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_DIFF)
>> +			ch = diff[0];
>> +		else if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED)
>> +			ch = se;
>> +
>> +		/*
>> +		 * We assume the channel IDs start from 0. If it seems this is
>> +		 * not a sane assumption, then we can relax this check or add
>> +		 * 'allowed ID range' parameter.
>> +		 *
>> +		 * Let's just start with this simple assumption.
>> +		 */
>> +		if (ch >= max_channels)
>> +			return -ERANGE;
>> +
>> +		channels[num_chan] = ch;
>> +		num_chan++;
>> +	}
>> +
>> +	return num_chan;
>> +
>> +}
> 
> ...
> 
>> +int devm_iio_adc_device_alloc_chaninfo(struct device *dev,
>> +				const struct iio_chan_spec *template,
>> +				struct iio_chan_spec **cs,
>> +				const struct iio_adc_props *expected_props)
>> +{
>> +	struct iio_chan_spec *chan;
>> +	int num_chan = 0, ret;
>> +
>> +	num_chan = iio_adc_device_num_channels(dev);
>> +	if (num_chan < 1)
>> +		return num_chan;
>> +
>> +	*cs = devm_kcalloc(dev, num_chan, sizeof(**cs), GFP_KERNEL);
>> +	if (!*cs)
>> +		return -ENOMEM;
>> +
>> +	chan = &(*cs)[0];
> 
> This and above and below will be easier to read if you introduce a temporary
> variable which will be used locally and assigned to the output later on.
> Also the current approach breaks the rule that infiltrates the output even in
> the error cases.

Agree. Thanks.

> 
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		u32 ch, diff[2], se, common;
>> +		int chtypes_found = 0;
>> +
>> +		if (!fwnode_name_eq(child, "channel"))
>> +			continue;
>> +
>> +		ret = fwnode_property_read_u32(child, "reg", &ch);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = fwnode_property_read_u32_array(child, "diff-channels",
>> +						     &diff[0], 2);
> 
> As per above.
> 
>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_DIFF;
>> +
>> +		ret = fwnode_property_read_u32(child, "single-channel", &se);
>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED;
> 
>> +		ret = fwnode_property_read_u32(child, "common-mode-channel",
>> +					       &common);
> 
> I believe this is okay to have on a single line,

I try to keep things under 80 chars. It really truly helps me as I'd 
like to have 3 parallel terminals open when writing code. Furthermore, I 
hate to admit it but during the last two years my near vision has 
deteriorated... :/ 40 is getting more distant and 50 is approaching ;)

> 
>> +		if (!ret)
>> +			chtypes_found |= BIT(IIO_ADC_CHAN_PROP_COMMON);
>> +
>> +		ret = iio_adc_prop_type_check_sanity(dev, expected_props,
>> +						     chtypes_found);
>> +		if (ret)
>> +			return ret;
>> +
>> +		*chan = *template;
>> +		chan->channel = ch;
>> +
>> +		if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_DIFF) {
>> +			chan->differential = 1;
>> +			chan->channel = diff[0];
>> +			chan->channel2 = diff[1];
>> +
>> +		} else if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED) {
>> +			chan->channel = se;
>> +			if (chtypes_found & BIT(IIO_ADC_CHAN_PROP_COMMON))
>> +				chan->channel2 = common;
>> +		}
>> +
>> +		/*
>> +		 * We assume the channel IDs start from 0. If it seems this is
>> +		 * not a sane assumption, then we have to add 'allowed ID ranges'
>> +		 * to the struct iio_adc_props because some of the callers may
>> +		 * rely on the IDs being in this range - and have arrays indexed
>> +		 * by the ID.
>> +		 */
>> +		if (chan->channel >= num_chan)
>> +			return -ERANGE;
>> +
>> +		chan++;
>> +	}
>> +
>> +	return num_chan;
>> +}
> 
> ...
> 
>> +#ifndef _INDUSTRIAL_IO_ADC_HELPERS_H_
>> +#define _INDUSTRIAL_IO_ADC_HELPERS_H_
> 
> + bits.h
> 
>> +#include <linux/iio/iio.h>
> 
> I'm failing to see how this is being used in this header.

I suppose it was the struct iio_chan_spec. Yep, forward declaration 
could do, but I guess there would be no benefit because anyone using 
this header is more than likely to use the iio.h as well.

> 
>> +struct device;
>> +struct fwnode_handle;
>> +
>> +enum {
>> +	IIO_ADC_CHAN_PROP_REG,
>> +	IIO_ADC_CHAN_PROP_SINGLE_ENDED,
>> +	IIO_ADC_CHAN_PROP_DIFF,
>> +	IIO_ADC_CHAN_PROP_COMMON,
>> +	IIO_ADC_CHAN_NUM_PROP_TYPES
>> +};
>> +
>> +/*
>> + * Channel property types to be used with iio_adc_device_get_channels,
>> + * devm_iio_adc_device_alloc_chaninfo, ...
> 
> Looks like unfinished sentence...

Intention was to just give user an example of functions where this gets 
used, and leave room for more functions to be added. Reason is that 
lists like this tend to end up being incomplete anyways. Hence the ...

> 
>> + */
>> +#define IIO_ADC_CHAN_PROP_TYPE_REG BIT(IIO_ADC_CHAN_PROP_REG)
>> +#define IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED BIT(IIO_ADC_CHAN_PROP_SINGLE_ENDED)
>> +#define IIO_ADC_CHAN_PROP_TYPE_SINGLE_COMMON					\
>> +	(BIT(IIO_ADC_CHAN_PROP_SINGLE_ENDED) | BIT(IIO_ADC_CHAN_PROP_COMMON))
>> +#define IIO_ADC_CHAN_PROP_TYPE_DIFF BIT(IIO_ADC_CHAN_PROP_DIFF)
>> +#define IIO_ADC_CHAN_PROP_TYPE_ALL GENMASK(IIO_ADC_CHAN_NUM_PROP_TYPES - 1, 0)
> 
>> +int devm_iio_adc_device_alloc_chaninfo(struct device *dev,
>> +				const struct iio_chan_spec *template,
>> +				struct iio_chan_spec **cs,
>> +				const struct iio_adc_props *expected_props);
>> +
>> +int iio_adc_device_channels_by_property(struct device *dev, int *channels,
>> +				int max_channels,
>> +				const struct iio_adc_props *expected_props);
>> +#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
> 
> 

