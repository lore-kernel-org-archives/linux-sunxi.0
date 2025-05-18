Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF736D
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586454; cv=none; b=T81FLsAGTuvjRcIiLCyeAzMQ8iBQ8QQuUcC4+CfSA4f3S/omLAwBsPpqljwkt2dSGo+2yE/G16UnN9GsHd3dHGeDBpWWnfdYp/go818a8+KmZo716Me1WRcYV5isckteyrlrNjvZoPuO+cwItwa9RWaJhHnTLpp30OWZzBchEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586454; c=relaxed/simple;
	bh=/hg4XOiM8dzAP+sj3OctfJb8nVC7grXLEYczEbyGvks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9uMeMTEqmrmE/DIquIGx7UTQbwrdtYb+uDgXmALUZHPpoPGKe4XCmytBId7NMphKMbPOuaGqXkJ5wGCl9Fu32XnsIfBNnjFhZmYdv4kNyCU/whH614bmcXVhldIPOYVR6+B5WdwwOjH4dO4nb9WD1NBW1ECH9djU+XjCLoP368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3288f926bc0so5396181fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586450; x=1748191250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hg4XOiM8dzAP+sj3OctfJb8nVC7grXLEYczEbyGvks=;
        b=q+deBS8pbbgPjsWCopO526QdjwH/v8bawxAuzBW25VLkIpEw6yXfJUPKwbb3GtSVrC
         JCcrDhaxbKzD/u2yu0Jr8y6Taw3OWYyr3OcN8OsdHWZMTtEjSIud6FxadJeMif8oEHSk
         DmqnN24s0EqBmIv0hrH4Tpdi49cVJnQlb74Q5Pe5lc7lhvzdGzE+hSEx9wzJK6lnnzy1
         sk078jiqh5qXhuimIHgYT/IGdAknJDb+79Ea0EQmY6OnnPSHmBF5FiVlSP4wSDNvF6zE
         TakY6HWpxKHiRW7JsT8HbAfG1IyqC5jRB1iQtHXlwDQf0AY84FMSNpmVT/fGFAV7fZTm
         H/7A==
X-Forwarded-Encrypted: i=1; AJvYcCX7nLwgtAkdGvsCCBq4H0jyh00VXm1iy1Z1cfZ6ST309hhi4YkFq3IYx3rNEJINJ2zixdBy9+5QZzwR9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUOlLEZd+Sn7kWKUXBBQ/DHdXj5/hdsmwA5Tz9LSCqNjZ2t8QA
	H5TrVGBaH6eMsIFv+XgId8RWkiOnpg0TFoudPuyEt2WAKVJYspoBmGcalHi8gxYr/a4=
X-Gm-Gg: ASbGnctTehJL8O7agXCx6i4e04McOv74s2Hpyg7K+amqW2EyFUWkbdsiQmZsDVj+w3i
	JPYaRB6ts/4hwqf1+TdOvSfxEhXsnwukCEt0nSqxYTUbeyKQJ89kofSHRbUdexQ7RTo2Jis2Q+g
	75btvKu3o/csJDjqHVaqTssajuzXS0M4jj9oZpkjehgm4nBpCWwbAZjw5faPjW/T2aAHN0n1y8J
	TfqMoTlI4o1MwlS4vY8h+VZewl+AeI2uOBYhURslXxkQDaWyE8M3L16pMObJKWjPFMsSS6xFIcT
	Y4RA+YBDC4TrfJA/2KSOypwU/XAozaijYnXsPZ61Ni69vrZIRb70xuWUJQTPxpzcRZsGxUs0KvP
	z1GnH0SBx
X-Google-Smtp-Source: AGHT+IGLDIlot9swCbGq8s4L+wkLW67qoTLzcBfvU8c9c/ZUwrOho8quNVXdG3xSeRgoxhuk1ii1fA==
X-Received: by 2002:a2e:ae0e:0:b0:30b:b7c3:ea71 with SMTP id 38308e7fff4ca-3280773e671mr24565021fa.15.1747586449822;
        Sun, 18 May 2025 09:40:49 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b3951sm15292501fa.19.2025.05.18.09.40.49
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:40:49 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3280ce0795bso21704761fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgP673MOvOWK5dDsKbxmdxwUsVHVkaezsRH9SGyV1pzg0cm7x5JLBps1URPsuUU49cjqHqripQh3sXlg==@lists.linux.dev
X-Received: by 2002:a2e:b8d2:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-328077cc6eemr39628791fa.32.1747586449458; Sun, 18 May 2025
 09:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-3-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-3-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:40:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
X-Gm-Features: AX0GCFtGZP94oDImPioaa5-NKNR-5OiIQ3Lm0O3X3TZCX6x7PwMx49wsoQ0m4fQ
Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] drm: sun4i: de2/de3: refactor mixer initialisation
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
