Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6121321A94F
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172082; cv=none; b=KK90LUF0sps3BRIgAY+AtHR9VeSmIzaaeGsmRvVy2TCWHVIj8cgW1F4NpWtE1Gaws4Sk4Bt01pI4mYEn24QJfUHljXFxOtQxKTyL3b3HObAmGV41OEkLpXVm/5PC7LkRmRI79JAvSpJ2j60QJHbYxdpvzDkH9X+TeAWPMlT5OPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172082; c=relaxed/simple;
	bh=QoUC6Qhyxqtfrpp/Ewhq5WKUwH5QMPUb0vC0OYmQgHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfhwepmGIm8cJ9+mkU0ypcaXABDSynLx7R9tno5WFO49sB3fK65g3J6XPbfwas4AG7c3DWfboHaAur8QNaUoWb6LjWJjs29o24ZE7rtCRX5cdvOgvd4Oc57s/oFzdmSlh7JtwYpn2L3WfgECm4eT+DTuNxzCFaAEzvuavvlF3yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZG00sL2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZG00sL2"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-548409cd2a8so6833769e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 02:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741172078; x=1741776878; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Myb8iOfwo/K4CWy++bb3w2FblFyh4mmShUmyEU2xmU=;
        b=mZG00sL2pyd2XtGD6qDBH+EBMUA1QC2esTDdghSPK7TnO2ISmaU44xP/Zf2RJQTQuX
         at7Ahz7ZbtOIM8/XOOkZQkF/ySGugrZZW0SEcY2Ugx7B7ZDKusjzKe47AlcnkC4z1ctv
         I0cxqbmei1Qkx6/RSCGZX5okxsn0bzQlditBtKlJdWO2YE+rEWVNh+SyoRseb9c1HbMS
         pYVpmhVVNmQBNw3KUVa+jMe61obVmbDWfyTJ5Whs0RbPDQqtuXB1lSXBFPbrM00m12tI
         YNANFTbYO8sM+UnipslVyG0g0Pne66JiuD0V91IGenT2/U4jav1gflf4BdC0ZvMX27Yw
         8Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741172078; x=1741776878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Myb8iOfwo/K4CWy++bb3w2FblFyh4mmShUmyEU2xmU=;
        b=nMxmqXxj1x2J8MAj5vT8pzpAHW9dj5LXPVDl8Jzck9WJppq4MVqDBDRgANi5Ct5DyI
         /NcfMzXUWeT9O46alaS0ZMGGWzAx8TSTUXI3pIlAJGJxdM0H7FmEynxdkPbS8S6RIiNq
         kNGVfmvxM0oU0I8gRaISlIE9dqj2NL/t21xP1y8/5jEa6SJwCYbM6OegGIVu5ymatIb+
         EIt2QhdNa0uCFKJICC5KawRZm3lCqpjZ5V18KmcDQzFNYUfPys+DV9fN/hMunrmc4zG7
         Bvu/b7e1Hs6gXjb8IrAn9sP0hiMfNRXpKMvQRMdXu1vezEq1EaMhI8wRqlCpzOnsHZ9b
         IwAw==
X-Forwarded-Encrypted: i=1; AJvYcCXkmBI2uEb1uKyyNB5YO/rBi/nWieGNeDHP3UB41v2Zpx241op+/TE+zTPGQ/Wbknuz6wpv5ZhMGsMhjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLrbjd0b/gXD4BIXF8PRrawYZEtm/d15B6fEjGuEKO+rOsfLTX
	nsNplojASWpF6Vi4tY1BbddoDH74q8AOqdsZn+jFD34uhCN98vvB
X-Gm-Gg: ASbGncv2BHeNZFWb8EFEiqmIebyHGF/ve1xj71wF2ZPRz7AqTD6dhUA2ifs0Tivkxt/
	ycfrZaMHeW8S4QmaNUroLafaElwCN//tkMPM+w77kZx8ObSSd84zhlg4LSqNHJQYP1v5+eSzwuR
	MQh7hKvYu54vWuL0q4cacZzXc6hSfNzFpTk4I4ScpRvYQxY3pErNresP2To7Pzrq0d9EVvHhmuV
	FIwjCMFF7Fub8hw8hrlFA4dA3v4l1ssXwOOu1ltSv304a3UWob14Tw3nMvj7UrhstPU1KQlqxRe
	KiO/LnttQ140n2DL5jbDR+4avjG2tBbyFtsKXpa3vEmyB20B/3SvQhCvEK9bCfsCL+JIcCPmlI4
	SslBJ/FHDxSC3isEZueOVfY2j7Q==
X-Google-Smtp-Source: AGHT+IG7+dALkj4mnhqEtYuKNaMtYCVDDovKQLGo6i+y4ha0bmLUd9DW+/Gn+j0UXQCjVleXTiXGSQ==
X-Received: by 2002:a05:6512:2214:b0:545:746:f36a with SMTP id 2adb3069b0e04-5497d376350mr1006837e87.34.1741172077938;
        Wed, 05 Mar 2025 02:54:37 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494ca38eaesm1601129e87.124.2025.03.05.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 02:54:35 -0800 (PST)
Message-ID: <54a031d0-df47-4baa-a23a-1a79c0922542@gmail.com>
Date: Wed, 5 Mar 2025 12:54:33 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
To: David Lechner <dlechner@baylibre.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the review David.

On 04/03/2025 11:25, David Lechner wrote:
> On Mon, Mar 3, 2025 at 12:32 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
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
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---

>> + *
>> + * Return:     Number of found channels on succes. Negative value to indicate
> 
> s/succes/success/

Thanks!

>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>> +                                         const struct iio_chan_spec *template,
>> +                                         int max_chan_id,
>> +                                         struct iio_chan_spec **cs)
>> +{
>> +       struct iio_chan_spec *chan_array, *chan;
>> +       int num_chan = 0, ret;
>> +
>> +       num_chan = iio_adc_device_num_channels(dev);
>> +       if (num_chan < 1)
>> +               return num_chan;
>> +
>> +       chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
>> +                                 GFP_KERNEL);
>> +       if (!chan_array)
>> +               return -ENOMEM;
>> +
>> +       chan = &chan_array[0];
>> +
>> +       device_for_each_child_node_scoped(dev, child) {
>> +               u32 ch;
>> +
>> +               if (!fwnode_name_eq(child, "channel"))
>> +                       continue;
>> +
>> +               ret = fwnode_property_read_u32(child, "reg", &ch);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               if (max_chan_id != -1 && ch > max_chan_id)
>> +                       return -ERANGE;
>> +
> 
> Should we use return dev_err_probe() on these to help with debugging a bad dtb?
> 

I am not fan of using dev_err_probe() in a 'library code'. This is 
because we never know if there'll be some odd use-case where this is not 
called from the probe.

All in all, I'd leave adding most of the debugs to the callers - 
especially because we do not expect to have bad device-trees after the 
initial 'development stage' of a board. The board 'development stage' 
should really reveal bugs which prevent the channels from being 
registered - and after the DT is correct, these debug prints become 
unnecessary (albeit minor) binary bloat.

>> +               *chan = *template;
>> +               chan->channel = ch;
>> +               chan++;
>> +       }
>> +
>> +       *cs = chan_array;
>> +
>> +       return num_chan;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER");
> 
> We can make this less verbose by setting #define
> DEFAULT_SYMBOL_NAMESPACE at the start of the file. Then we can just do
> EXPORT_SYMBOL_GPL() throughout the rest of the file.

I am not sure what to think of this. I use the good old 'ctrl + ]' in my 
editor when I need to check how a function was supposed to be used. That 
jumps to the spot of code where the function is. I'd like to see the 
namespace mentioned there in order to not accidentally miss the fact the 
function belongs to one.

OTOH, I do like simplifications. Yet, the added simplification might not 
warrant the namespace not being visible in the function definition.

> Also, I would prefer if the namespace matched config name (IIO_ADC_HELPER).

I had some lengthy discussion about this with Andy and Jonathan during 
earlier review versions. In short, I don't like the idea of very 
fragmented namespaces in IIO, which will just complicate the drivers 
without providing any obvious benefit.

https://lore.kernel.org/all/20250222174842.57c091c5@jic23-huawei/

>> +
>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>> +                                         const struct iio_chan_spec *template,
>> +                                         int max_chan_id,
>> +                                         struct iio_chan_spec **cs);
>> +
> 
> There are some different opinions on this, but on the last patch I did
> introducing a new namespace, the consensus seems to be that putting
> the MODULE_IMPORT_NS() in the header file was convenient so that users
> of the API don't have to remember to both include the header and add
> the import macro.
> 

I do like this suggestion, and I believe this would be the balance 
between getting the benefit of hiding part of the symbols - while not 
unnecessarily complicating the callers. I know some people are opposing 
it though. My personal opinion is that having the MODULE_IMPORT_NS() in 
a header would be neatly simplifying the calling code with very little 
harm, especially here where including the header hardly has use-cases 
outside the IIO ADC.

Unfortunately, the "safety" seems to often be a synonym for just "making 
it intentionally hard". As Finnish people say: "Kärsi, kärsi, 
kirkkaamman kruunun saat". :)
(Roughly translated as "Suffer, suffer, you will get a brighter crown").

Let's hear what Jonathan thinks of your suggestion.

Thanks!
	-- Matti

