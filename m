Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD11B395F
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735839928; cv=none; b=a/YbtQgJ/aQRPRZcEHp5V/2+qX2+gENxrfJp0JTmk2XwMJENTKpXZaLiS+Ws82IFWeyserkV6RcmvNmzEmxVPXMzKZV5DzLs1gBzhn8LHfY0/a+XQLRBGZfH/XGgKwHIsu11FfbcyUA8SOtEbmTLJKCW8/QHj/r0xTCcQwTXz4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735839928; c=relaxed/simple;
	bh=+rX76GSNyzHVSRa8e7aEOxdkbuGL68TpQgt8jW1PURw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmABev7/qMqKNbuRGHhtpsx8ELR6FHtdu+AMrhTXU0Qj1rg0CGYMktXAatn/mWMVTCCJeeGf0e0LadjGdSShJrgU53aTHim+VaYHsx8RJ/m+753QwXyADH632LQzQxBoLjT3uc63okwh3od2a4J+uUW0tOWf/u6ycv7d5j1oyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3004028c714so129021281fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jan 2025 09:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735839922; x=1736444722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rX76GSNyzHVSRa8e7aEOxdkbuGL68TpQgt8jW1PURw=;
        b=V2mZSGEzCqgUgeTnfNhEEKHYamujTMoFopBwiNO9GVOZMRSNfbPb8qkkDCu2nQ72Tm
         ZYWlQIPNDWdCIBs5Xwr1PQaU8wDxTzSaJVeGZQxtnDLLppohs9Ul98e5N6WsbkhsZ7xd
         FDamSUqFkwcTE110LEfbcYSS4aTys77+gpGcZet4Zzt9uWOAmUxzsUBVaNKUrQe1VRZG
         Kt0s8ayhXrwWGY3wTjwB5X2hqw52zU1xVMeiWfFnIE5rDT89lqwDC9pyY9RLkUZvUVjX
         xjpeF/2qfBfNXgFLHNJyaLQRfBa0bLefBQX25rUZI84r7vrrfEMYMD0SGc4kr0xJbPPH
         kEHA==
X-Forwarded-Encrypted: i=1; AJvYcCVygquENzNg8LSBq4j9AhyIxU7Ak67pZDKwtRWVd6dMxVcjYoGGEEYZN2WNTjOrx3ScjBNJX9aPvijRSw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6c8srxKKG0ihtl9V0yyi3RqR2PIMyhHQMBWbI3EZN+midyxYw
	X7kzuOcTt6aTCbqNpbYpEHIYfQg52OP+iUwkknZRGkd3MwUUQIxnX+rs79CE
X-Gm-Gg: ASbGncs0i/1s2yh4pguXCsjfejkBmL4ZuPxFIZOzyJcm3wlle6lyCy88Lf2NBKkOxVC
	SpsiaicVu/IJCmj24CUSTT+N0nAjybjDSiozOxY75gwkyL5FlsYuptLKvBsG8KvUGZ2TM/v8XTy
	OZJaPMjAdL2u8Y/uP6tRwrcCV8zSvL2oLOw/CId/btpBKar6fn6ICKT3NCfU70L1GMtuGbW0xVI
	TzjZ+e91ucvsTyz37RzccRzSxfPnzNNZ3StL0uQJNRKj4lZK9u+6NILBosEvHu/q2md++9OQyxL
	fkrXriO8vI8Miw==
X-Google-Smtp-Source: AGHT+IF0BOuU2RPUaczVggdymEi9qF4lB4znlcM4r/fJmmwCcZ5571yz8M5zyHUw7tfpD87QmXrogA==
X-Received: by 2002:a2e:be9b:0:b0:302:3356:7c55 with SMTP id 38308e7fff4ca-304685462c3mr152206811fa.10.1735839921642;
        Thu, 02 Jan 2025 09:45:21 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c5eesm43544561fa.8.2025.01.02.09.45.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 09:45:20 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3022484d4e4so144741971fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jan 2025 09:45:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVw/iza3nTKUXDRdfZSIXjhs+YTwaeg0him8qtLieoFJInDKKbWDldf82i1NrmeCBASF8/qabhXJqd3sw==@lists.linux.dev
X-Received: by 2002:a2e:a546:0:b0:302:1861:6df8 with SMTP id
 38308e7fff4ca-3046861cce9mr148699451fa.33.1735839920320; Thu, 02 Jan 2025
 09:45:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org> <20250102171424.3644-1-lukas.schmid@netcube.li>
In-Reply-To: <20250102171424.3644-1-lukas.schmid@netcube.li>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 3 Jan 2025 01:45:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65FutJMLr8siH4LjUHVr8AconH59Y5JrVCWwgH9DGDP0w@mail.gmail.com>
Message-ID: <CAGb2v65FutJMLr8siH4LjUHVr8AconH59Y5JrVCWwgH9DGDP0w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for NetCube Systems Kumquat
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 1:17=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.l=
i> wrote:
>
> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
>
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC
> - QWIIC connectors for external I2C devices
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

This seems to be a new version. Please tag the patches with a newer
version. `git format-patch -v2` can do that for you. And please
include a changelog listing the changes between this and the previous
version.

Last, please send the whole series, not just a single patch.

ChenYu
