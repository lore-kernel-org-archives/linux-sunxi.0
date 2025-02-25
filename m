Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DEE267380
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479379; cv=none; b=dk3RRZSqzTPy/h4Iuz4uKusn+X/SV3IqbhY1x4bd+3tpO65lPtWD6a3MJcz6WWTegaed7T8oC8DZsw5EEACmFpUTEJQWQqKBUclSkVbKi8Hi1hkBHpt83UdD57OV1L3c2f7JRujOMB6DFJ3XVTmj2fs4MG1DqlXPr2wltMdM+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479379; c=relaxed/simple;
	bh=czyNMmQ/7Ah76zJ4b6hYIfgvlQOfDiU6dsov2tq48tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5eIVWmWEC/VsaQD7yLt9t1VUlVGUihl6lVwQpvtv9Kp4E1xrg5OuVfIrGZmUEeWaZECUwsHGJGX2igCgUF7Pujm/CrD08gwiNu6rQJNIUcr4VVdpssUVj/PIIVrxRFWUVVgIiXPpHSGojurx5PS92VPpKemCPIfhTHDdUt4INI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeIAz4wr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeIAz4wr"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54843052bcdso2674037e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740479375; x=1741084175; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FWLaiabtNirDSi5oyCbdoPFm0NWp7Jf1VqisvjNdfA=;
        b=MeIAz4wrEzWpEdBAIbnFgTrTLSUMYksrIEvR5J5ACxi/Pkz8IWzqbwvhs+u22+nPeG
         STLXmLi9lDulIhvXQgnSE8lwbrKDXs5QuAXBSw1a/gNnwtuaJMSOeDtEt7IEL/JbBGqH
         wsQ3eNj1qaQ95mvX/esJX7eqluwIsFvuMtqbKGzbYMYwq/JFYNrptbk+2OHw/czA2VjH
         j5s5c5iBK2SYXKfkL8j/9Dyc1h5Ilivy5tGgsrptDMAQU6BMvFaOwobssrRnobO1+w8L
         y3ymGN9uFBOQeGXh0swv6rZq1YLYSwUpGiG6B/KcoaWeMPsicCh5PLloS7VPeE1DoFx4
         cZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479375; x=1741084175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FWLaiabtNirDSi5oyCbdoPFm0NWp7Jf1VqisvjNdfA=;
        b=Vz1wOgY1s4OmyR+ckVJbtBi1hfTDFb2K39vqKpuK5EZuO7zGn9TuP5zHwfObJefbCy
         AEsOsW+pMew2z5xJLD7Tg4OcYq/PABdKJzA0guFW84+z6ZgePkDNgw7OXRg5/wr5QqKH
         V+ol94WjRTBbmKVjsRtMXXIZp1FUqqCeOIdkFm/+wQfUb9lIU/lhRFOp6GGwDI5hKuiG
         ZRr2wI4qO/9hLPXLFkY4SXXBHATyFZXeCNQ8uvR1+f43C1KZx2G4iSClaU72ptcmGLo3
         qmS6y3m5uak3fLbIGP2H3p2H7v6GwwxlEoGtYA5KbWoMebavvJqt10iCxg7mDUfZnelb
         xwEA==
X-Forwarded-Encrypted: i=1; AJvYcCUQRbeor3dNjdKCFTy+5z/1888SqGa+64ZpbGtN4L2WL41lXmdsnpq0/YrLdbyyhphJuep7t+5TcjKUIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTLzb+Jh6lgRL2l2CxeqJbQn4R8vlwRUUXUZ9tZwBr3oFLl7AT
	UT1svjuWMt/ZMNWOpy0JhYgVEPkYg0gn9RYM9u15nKoPXbu1KHuD
X-Gm-Gg: ASbGncviwFtL4JMTb6CensnJtR/eV2y5zZQWDjL8jWzqs6nayG99nQ2hxIdsWqra3dY
	jjfDpqYQ1tA3jrGLJ+juTbOy/gbWz30mmumKnBHqykcDsTxk2y9F7JeucjrDRk++iWlgDu0sWRf
	JWtxQhLVJZl+UXPm5D99+x1g4BjUUe9AikV3dkFpbxA9TlMI25YkC+cMrrgNpXEWmCkkk1E1EIp
	h2mlwINeb+Ik2ztGabZ65gBUXhrLmvMvai0spXW7fC1RoZi7h+U4VPAKD2/px1ZmpY/ZfzdsGjd
	DukJMUa/Jx8XmHngHKqEez6s22RXMKT882nm50A=
X-Google-Smtp-Source: AGHT+IEOX4SAkVcbCaNkIS5Eiz9jLOGMD6nDNsNIgWnc9c9zZ4J1lGJhqX/FRtQ2oyAHuj6SZ749OA==
X-Received: by 2002:a05:6512:128b:b0:545:ee3:f3be with SMTP id 2adb3069b0e04-548510ce69dmr991958e87.10.1740479374858;
        Tue, 25 Feb 2025 02:29:34 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f742fsm133919e87.205.2025.02.25.02.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:29:33 -0800 (PST)
Message-ID: <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
Date: Tue, 25 Feb 2025 12:29:31 +0200
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
> 
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

After taking a very quick grep I spotted one other existing place where 
we might be able to do direct conversion to use this function.

drivers/net/ethernet/freescale/gianfar.c

That'd be 2 users.

While I looked at it, it seems that a 
'device_for_each_named_child_node()' -construct would have a few users.

Yours,
	-- Matti
