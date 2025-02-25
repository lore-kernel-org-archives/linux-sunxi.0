Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC9267AED
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481022; cv=none; b=Bo6xanffkvBEx3hmfv5bc9iD3sU0U8AXSjsuBMAlM/Inc+BA0VXQmC8O4YvjXCa4ueVMTQaWWENIOnVjL7OfpUiq71mFL0p+lGByo3lj/htQxOm1r+R8vYa24yX+7xmwr/dC44SH3OD+J7HCp3US4TsxQd+k+5CWkC0qfVt7kuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481022; c=relaxed/simple;
	bh=2YozzQHz8w8HrGbTyvr5eXnrPoFj0GWuc89p5e2auWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWWoTzG11xsTGGIfnaGFRn2aA8J/ayBgLNOWtiAHKmQz01stiVbFYyu3MD2J4mXArzc1l1TxemhLaS+N5KGyxG51xbVGukupvSisDDmT79510p3FAGqAiohTrCw4vaiWFAElhajudNX9m+0aAXuQri0201e4FH9bxg4AqJ257eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezpfbQ1k; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezpfbQ1k"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3061513d353so57350581fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 02:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740481019; x=1741085819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/fHdL9OxTBfJ/OtLlF+A8QVXV0YakMI11nkG7r9zEY=;
        b=ezpfbQ1kb4+ckutbPrA7A53YIOGGDALaDburX2b3DvCkE0pD9TyndJR9gmK1hePYzw
         +fsFMdUmMuknUbfZxkJe9Wk7ibEmcLZ9cJ2ILIo3Ia70dupIUcPopzes9v28gMcbbEHh
         4Z1GlT8r5QYxK2BvVxKf5XsOs67FyOWfupLfGvWvOuRCnWIbPHFryWC07lrwnCrlFw83
         kzb6C/qdKOuf/Wo1fdVqu9YfuKf1D8xg/reo6nM8j8oq/kuyTx92ZJFooNDyFbk/pNk7
         tNX9okKFPYUd4CrDrAO9v5ybAp+Ijbd+VNcBaN6g/8nNM3GKyLWid3QyFCOIhimHfxLx
         5V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481019; x=1741085819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/fHdL9OxTBfJ/OtLlF+A8QVXV0YakMI11nkG7r9zEY=;
        b=LctR4iqzSjRA2b2frDkj+9jt+FkiyhZ6HAfqsuG4dVJnByPPUOcXhsu3xK8YG/F0Eb
         qtxV3weqo6EyOM2GXdgc0UkQzf7kW0jJookapCLj8U5b+NBFYyQgRrpSjrCtZZ3mu61P
         PQ5htrK2DpefBnXaeXIw+CooArptYp443PpVUdmOE/xrpawgH4EDMqtm3aNzoRIiS1XO
         4foejoBf4K12XNKhyeh0xkz0HWd/0+24ko/kCTM6DdjWx9PpMhIXrdCZl/+u1TjZ51y0
         JCnpV03lyy1tygbY87Uf3zPzGyW1R2GtcKC7jQ4nF5Z2dv/ivZ5tpTbFWFG4L95C3GsC
         YElg==
X-Forwarded-Encrypted: i=1; AJvYcCVqtcrYGlHv0s0MQjHwzIPVqcvNNleSeDF7+9bxb3kCN8EGj+M4uJBBUAm4QGFOgmy305dMtKfERCPVyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTqiMxXq6kWoh6mlu0q9sDCQjuJ2yLYQ+NyCmzXW2gNnWgAvUP
	HC/TJI89w8WaQdNw+xdeRNpub1H6JOqlmGRv6HQAP9tO6TZMoU90
X-Gm-Gg: ASbGncskej9uyWWnscXbsuJ0JYgd2AjNryczqPNA0qcADtkjJ9FcWoKrBjzFr3Jhy0Z
	2CxujAwzNBaZJtpzkP9mTKUWGYhHA7rgC7hBeML3SUqjXjtN6MHJUPkKP9cTa8exFJz492+P2qt
	2GS2Or+RJescbkCzpGxVKTlMp5updv3lTJP5AwSGtp/EN9WdZxKq0YEu21M4dvXvwtJY59wZXMA
	ksf/qM3VzMtXXgMOuC16dL7onynNI5rBGdoRF20P6CF/P+1CZdacqQu+J1wo1i8sl2nexXWzazb
	f0detQmBEQYfC/FTyOSonO/cfsJ69fyQdAWbY04=
X-Google-Smtp-Source: AGHT+IH2/CKNaTosFs8GlS0XdmUzabLuIWWzOTmpp5OU7F/me7OdOFzkGeicuNnt7xucX157I9qrZQ==
X-Received: by 2002:a05:651c:22e:b0:308:f75f:457 with SMTP id 38308e7fff4ca-30a5b18ae70mr54123081fa.12.1740481018475;
        Tue, 25 Feb 2025 02:56:58 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae80besm1961621fa.93.2025.02.25.02.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:56:57 -0800 (PST)
Message-ID: <1e0a9915-fe52-4569-9da0-b0761ba8fedb@gmail.com>
Date: Tue, 25 Feb 2025 12:56:56 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
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
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/02/2025 12:21, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
>>> +/**
>>> + * device_get_child_node_count_named - number of child nodes with given name
>>> + *
>>> + * Scan device's child nodes and find all the nodes with a specific name and
>>> + * return the number of found nodes. Potential '@number' -ending for scanned
>>> + * names is ignored. Eg,
>>> + * device_get_child_node_count(dev, "channel");
>>> + * would match all the nodes:
>>> + * channel { }, channel@0 {}, channel@0xabba {}...
>>> + *
>>> + * @dev: Device to count the child nodes for
> 
> This has an inconsistent kernel doc structure in comparison to the rest in this
> file.

Hmm. I'll take a look at the differences for v5.

>>> + * Return: the number of child nodes with a matching name for a given device.
>>> + */
>>> +unsigned int device_get_child_node_count_named(const struct device *dev,
>>> +					       const char *name)
>>> +{
>>> +	struct fwnode_handle *child;
>>> +	unsigned int count = 0;
>>> +
>>> +	device_for_each_child_node(dev, child)
>>> +		if (fwnode_name_eq(child, "channel"))
>>
>> s/"channel"/name/ ?
>>
>>> +			count++;
>>> +
>>> +	return count;
>>> +}
>>> +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
>>
>> I did not check how many users are you proposing for this, but if
>> there's only one, then IMO this should not be a global function yet.
>> It just feels to special case to me. But let's see what the others
>> think.
> 
> The problem is that if somebody hides it, we might potentially see
> a duplication in the future. So I _slightly_ prefer to publish and
> then drop that after a few cycles if no users appear.
> 
> Also this misses the test cases.

I'll also take a look at the tests, but I have a bit of an attitude 
problem what comes to unit testing. Adding tests for the sake of having 
tests just hinders the development. It makes improving functions less 
appealing (as tests need to be changed as well) and adds bunch of 
inertia & maintenance cost. Sure, on complex functions having tests 
increases the confidence that changes work - but I don't see much value 
here.

Do we have tests for all the property.h functions?

Yours,
	-- Matti
