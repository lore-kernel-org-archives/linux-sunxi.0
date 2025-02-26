Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFED26BD83
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551959; cv=none; b=f9LRHL9p+TQUr94YIsfyXEIKKeZI6PrYVi2h6MZ+fRtHKL/mj0MfcANjzWiniDn7c20F2SI3tHXVf6S8iF9gMX5pGi4MCr1M/vIOANDtzk/eWZ2JVcSX4SsURrF3ji805pmPaqXLKgMv2oDzd6+/CiQ3iVjPsdJ1kV7k5/QrbLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551959; c=relaxed/simple;
	bh=g5vd5KaFOaIGh4dgJu04AUD2p2OpmMkuWZMXJcPEHu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3T4pddJnFh5cM2RlyEgHqw14ySR17F+/QyiSeqnR3ca08ujx7aeoYfwCUNUmGEQeiZMDf5a6aTl/AbHrGxYIZoUzIN65RmSFPtakAZWEOLTgdp2hrVHBiDTt7UUyXZYAdp23WZ0VsiuBu9fje33hakQRDJvq/vUlzRgYee9U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABRLW4GD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABRLW4GD"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3098088c630so61133741fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 22:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740551955; x=1741156755; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IstkuYPp0cvmrCBS1AO74kpqX9/bPmaEIwBW2fMXgJ4=;
        b=ABRLW4GD0Dpsr8QOVJByEcUwUhvmWcM6gB3TxXxEcdQiDWtUEXLrmNOYzlH+2fghPu
         IUCBexEkcUPcggx9AFa16sVgwdPDsowxopFquOUDG+N6BXMBHasSSTS75oq9k/qDXqPX
         s9ytqb+Xqa/zVlRNne9EDIoySmGmSorp1vxx7PA6WcyICTeVJ+OFziMKAtwLv4nn2GSB
         SW+hSO+91kbWEcto8I9NHZKp10dr1Dkv9dlnC+18roHnLKT6HdPEg2c5nlgtF0GsVInP
         Piw1qlVaMscvi/pbOUrlaLBEdajKFR0F/mZtzaNguaEq2rm//SXkWziuQKGy+5sfmxUX
         lC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551955; x=1741156755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IstkuYPp0cvmrCBS1AO74kpqX9/bPmaEIwBW2fMXgJ4=;
        b=UQjhX2X7GZBbnw3yKbsXsT4+yMk9R6Vha56EfWFtpVB6fmm5smUT8PL3Q+OV2ifHj1
         y+VqPnMprvq/LYS+t/1Xy+VTSlktufjXGJ5j82+Q6PN8l3i4uIbV6kTaGFB4sFtmfMJc
         H/td7/ulvF9tEjhN6bEIh7QhswMocVAvyb+Abk3H6wwoR1/pYzZ7hW/5vZo7A29vPBKB
         J/JWiIjFFJZbIw1qN+MyojrPzBksFyzeHxx5vZHK9b4Zlf39adV1RmwyIx/4O/OmDpIn
         LMKpb8ILpgKPfUnQW5l6n3qgp/VUsn4cqbTvFDvlRKSC6/0Rf2eVwq9UxJXnNbT5er26
         PxSg==
X-Forwarded-Encrypted: i=1; AJvYcCVvfGG3Q27Exy6qIPjO4WMuLdXGdm7e0bb9ETnthT4W6GvVVbUFSkntBCiWebagi5afpIbANludZfq+0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb6yoCiXkDaKCydHGduCdRuQx+Dc0ZpC6F7ji+psP4L61S8mh8
	QC7KYU8CQOpo4wSRPDu/Chlh++MafZqg41K9kd+1ABqhvZdC3RpG
X-Gm-Gg: ASbGnctHEZsOxM5eASmyWZRzEvTJ3G5qMALt+raESRtssJVlhm7m7o4n1Azi1UxTxAM
	oHn2H1+yArHVag9RCMOJKVz/cRzpuUU5nMzKH+H7+5igACsX0wGFzdIF4zErcvZarbgCTg0JqVL
	1TLb2c/RV2IBGRIIsTFctuk1Fis3CVoG1kK6H6n81SXPJNnGP3vNpqbezhLL9Mz1cr5WlnITb0j
	nQKK5Jm4kONqt3kksUru9Ca9mCRRC95TW2Ky1E+bp4ddIaB00FqzKe2w4aONrHaxA0IccvSpyf9
	wyUqIJKjLxOdGvVMsow1kBsXvHXfnzZQVniciPnv+HKBKOczcjcPIsdHzlAdH7JS0gQdOONL8F6
	Em86NdAk=
X-Google-Smtp-Source: AGHT+IFhddv2BVjLa64XQJMIkv5m8GKYZ1reuiVfZ9tztojl8c9MwGp7Re17nRul5qHTHrRj15T3+g==
X-Received: by 2002:a2e:968c:0:b0:308:eb34:103a with SMTP id 38308e7fff4ca-30a80c97fdfmr38366891fa.28.1740551954311;
        Tue, 25 Feb 2025 22:39:14 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ac4873sm4197931fa.79.2025.02.25.22.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 22:39:13 -0800 (PST)
Message-ID: <d391b012-0a8e-40ca-af56-ca73b3fd853b@gmail.com>
Date: Wed, 26 Feb 2025 08:39:11 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree config
To: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
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
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
 <f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/2025 02:09, David Lechner wrote:
> On 2/24/25 12:34 PM, Matti Vaittinen wrote:
>> The ti-ads7924 driver ignores the device-tree ADC channel specification
>> and always exposes all 4 channels to users whether they are present in
>> the device-tree or not. Additionally, the "reg" values in the channel
>> nodes are ignored, although an error is printed if they are out of range.
>>
>> Register only the channels described in the device-tree, and use the reg
>> property as a channel ID.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Revision history:
>> v3 => v4:
>>   - Adapt to 'drop diff-channel support' changes to ADC-helpers
>>   - select ADC helpers in the Kconfig
>> v2 => v3: New patch
>>
>> Please note that this is potentially breaking existing users if they
>> have wrong values in the device-tree. I believe the device-tree should
>> ideally be respected, and if it says device X has only one channel, then
>> we should believe it and not register 4. Well, we don't live in the
>> ideal world, so even though I believe this is TheRightThingToDo - it may
>> cause havoc because correct device-tree has not been required from the
>> day 1. So, please review and test and apply at your own risk :)
> 
> The DT bindings on this one are a little weird. Usually, if we don't
> use any extra properties from adc.yaml, we leave out the channels. In
> this case it does seem kind of like the original intention was to work
> like you are suggesting, but hard to say since the driver wasn't actually
> implemented that way. I would be more inclined to actually not make the
> breaking change here and instead relax the bindings to make channel nodes
> optional and just have the driver ignore the channel nodes by dropping
> the ads7924_get_channels_config() function completely. This would make
> the driver simpler instead of more complex like this patch does.

I have no strong opinion on this. I see this driver says 'Supported' in 
MAINTAINERS. Maybe Hugo is able to provide some insight?

>> As a side note, this might warrant a fixes tag but the adc-helper -stuff
>> is hardly worth to be backported... (And I've already exceeded my time
>> budget with this series - hence I'll leave crafting backportable fix to
>> TI people ;) )
>>
>> This has only been compile tested! All testing is highly appreciated.
>> ---
> 
> ...
> 
>> -static int ads7924_get_channels_config(struct device *dev)
>> +static int ads7924_get_channels_config(struct iio_dev *indio_dev,
>> +				       struct device *dev)
> 
> Could get dev from indio_dev->dev.parent and keep only one parameter
> to this function.
> 
>>   {
>> -	struct fwnode_handle *node;
>> -	int num_channels = 0;
>> +	struct iio_chan_spec *chan_array;
>> +	int num_channels = 0, i;
> 
> Don't need initialization here.
> 
>> +	static const char * const datasheet_names[] = {
>> +		"AIN0", "AIN1", "AIN2", "AIN3"
>> +	};

Thanks for the review David! I do agree with the comments to the code.

Yours,
	-- Matti


