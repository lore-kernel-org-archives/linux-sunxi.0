Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5771D54C0
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 12:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740920062; cv=none; b=mB/AHE13Bi4Icx5cQP3hHYIYgKuFKuhctEfrmi2Ontr7mdhVacs1hEAmRaxFP189CBdWZ90NNfc3vLdPLWKzjml2jwDqx4XFYnTtEn30R90WeKJeMn1gul9uBjw7vA2wM4QwKxgc7eeivK6m99/XXfumeMzfn3ZJ0zhYf6qxsEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740920062; c=relaxed/simple;
	bh=VKIyH1CTs59Hr7vr+2y5gBC/sPB4SNStOV47/070Lb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MosUSVeEwwcxFckh2Uz5GNVGpYj6+D90EAkgqdBqHPxQR5EYosVOvAxD4bUAhW1ngx2ho8XSnnARuwNxbi01wLhS9YmEUVVgvFDpUZpK5YM+BoRJQ1Kqyj3zyd/QS8Ib/Wit2u9gphmJho9vSHGU8X91qOibA0u6B7RIXOF8+3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1Av4HdX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1Av4HdX"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bab0ad5a8so8248251fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 04:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920058; x=1741524858; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phXyydY7gGfZlc5DxydLzP5lRJMditp6NpQC5fmMcrY=;
        b=N1Av4HdXvCZKAFYH6XIMBDPOGnUew6xSKj5jVSlZSZxTXXZjLpzQol7mj41rDpW7SN
         VdJkW3kKBk+R4RTHooL4bZRQ9GFlAjW9DSacxwI0dMbeFbjFFtbknPRDYEp1ttaA9Ud/
         joSGgJ0rFmaU3TBqe66OSA2DpZ8wIPGUOMCQz3sU6fEjBRulXOmjBTlGuUREbPm4DvXQ
         kkSDhSY40jAx9VHs0gI0iCf0bxVTGpHOZFKdYsl9511RKyM3f6GWv1Q+jTlrGhhwT9l+
         ONqoUwOe4Hb4sXgJu5ahipK5zR9eRgDCGmwF0ePuMrQHTYMxOeyhE5NJmcvlkJk54YCr
         wFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920058; x=1741524858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phXyydY7gGfZlc5DxydLzP5lRJMditp6NpQC5fmMcrY=;
        b=h2ozcxQSuc5qU5JlvgP8Qz80sEVWbMMsjaYg0eKukzZivTThdnvyr7XqbueBlH9jHH
         oGgvmRSbZaO6xeURROdOAg4fi+WShm5PB63JmjgaICpk0U4UDXh5/WgqCxT69mYNgR5k
         qYPgtT/sMbTv1uKZUJL7UO2jhdM9LabE8culATekHm1zEzMhkfrD5Y0AQJg/Hb8u5E0m
         Lrp/CAUTSgdMHb0FMNkX9coQiWH3teHSjITFKAYeAd+2h9fpE/EVNef3pWtbNmSxKe/S
         TKv5knjgesLzE2toDUlTDNUthmbI/IZIfg6LI2TNhiFalHFdLgoLWAU/RzfWdOF4XcyY
         wiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd5h/jGsm/FSMEPlKOOVFKbujif4v/4yMIKpNzOL/eLzHhDrui6CnJWnVL+p5ehBdtbPMWXfHHB+PYhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YytTrUfqlehyd23ec/KxYrzb0xfoZX3wWxuR04iVILKWpzmHGKI
	ag5QTMdWPWpqwQp3zKe66Xz/NkLOIoMN+Uoz/EjMT6oA5fVpRyB7
X-Gm-Gg: ASbGncsoSwn+xP0qmRTzkSDnQle/aYnEWCUdNE1JhRDNtv3gGeFQLhKr1160gf5nasC
	tuAw58yFWO6OhMGK2oDXJpe+3N0zNRFSq0/eEj3AswfsR2O3kk82tj3LKnTCDxp5Af/1RKcOfnL
	sMO00nnB4olFNVjND66v0hF5wUpg/gGlI5N/ltODEVxcrmm8tMpb2Fmqj3saf8rVC2tiqTkGMD5
	WpmFmwi35WdJHjSGPbFRTtjS4PBW16Jrs4/etSrgWsdAwisgUmQ8dNZu/5mpH2krWvTZb4GUqMp
	FxRCXSQoN1F7ytS+aiy2TayLUETrAeaCFA9mnZZoIo/3/2UKD2tc2KhpOUzWt2FXCaV+ffc4AJN
	3ow6ViXGE/uBwZoICSE+FOBV1MQ==
X-Google-Smtp-Source: AGHT+IEJN/8WgRnH6T4J4ZG7JcpCuAO5jHwOEQHkq0uxIoxZ3O+QiARmgECict5SIiXPtktkXgM2tQ==
X-Received: by 2002:a05:651c:501:b0:30b:b28d:f0a6 with SMTP id 38308e7fff4ca-30bb28df3f5mr7934721fa.8.1740920058224;
        Sun, 02 Mar 2025 04:54:18 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bae88c37dsm2568041fa.37.2025.03.02.04.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 04:54:17 -0800 (PST)
Message-ID: <eaede287-658d-4c23-b217-5bc8053e64ed@gmail.com>
Date: Sun, 2 Mar 2025 14:54:16 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
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
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
 <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
 <1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
 <6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
 <9180ff11-888b-453d-9617-4b3a0fb38d91@gmail.com>
 <20250302032054.1fb8a011@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302032054.1fb8a011@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2025 05:20, Jonathan Cameron wrote:
> On Thu, 27 Feb 2025 09:46:06 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> On 26/02/2025 18:10, David Lechner wrote:
>>> On 2/26/25 12:28 AM, Matti Vaittinen wrote:

...

> So today the situation is we have all the options in tree and we aren't
> really in a position to drop any of them:

Sure. I am only really interested whether we want to prefer some 
approach for (majority of) new drivers. Furthermore, I believe there 
will always be corner cases and oddities which won't fit to the 'de 
facto' model. That doesn't mean we shouldn't help those which don't have 
such 'oddities' to work with some generic code.

> Hindsight is a wonderful thing.  I'm not sure on what policy we should have
> gone for, but now we are kind of stuck with this slightly messy situation.

Sorry if my comments came out as criticism. It was not intention, I just 
try to justify the helpers by trying to think what new drivers should 
prefer.

> Helper wise if it expands usefulness we may want a bool parameter to say
> if we skip the missing or not + make sure a max expected channel is provided
> (might already be - I didn't check!)

This far it only had (optional) maximum channel ID for sanity checking 
(useful for callers which use the ID to index an array). The bool 
parameter would also require a parameter specifying the number of 
expected channels. That'd make 3 parameters which may be used or unused.

I don't think I saw existing code which would have used these 
parameters. It might be cleaner to add new APIs when we get such 
use-cases. That should simplify the use for current cases.

Thank You for the long explanation of current system + the history :) I 
appreciate your guidance!

Yours,
	-- Matti
