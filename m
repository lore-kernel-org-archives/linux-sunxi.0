Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0533F6
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719085344; cv=none; b=Y7EO6hkF8ykeD8DDpf5kF2rhD/q0+dzOi7Q3nBKlPi0JOA6LMy8R/72w1GTeQijkWTaABWdAJEJUWfYiv1P7fMzJNjA7gs/OIMsT6FVgDKfNwv1Iin/m3SZij/UiclIgvKZISTtoGHSEs4ph4eRIU88tsnktTA/+WStKMXywu60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719085344; c=relaxed/simple;
	bh=fcJbsy2jm25GAUnNM9Xcuj1AU2NBoRKuw3UTI9/38rM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZwAbnok4ilpWpguMdUmJIjQr/WV6lsb/JVQwFcKd/+cOAzw+hmfD/4TPFCmTmF33KxdsLm3HUh3Djx6R/pRCfLGlx+UER6GzaDc3SwATo4V6JaydnnPniD2tD8zgCQc/DGfCmo/X5+4F+GD1na/uNmtBL6beptGsvRxGimY82HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOksPXYy; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOksPXYy"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so32893251fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 12:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719085341; x=1719690141; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcJbsy2jm25GAUnNM9Xcuj1AU2NBoRKuw3UTI9/38rM=;
        b=DOksPXYy7vtI5je+B96n/Lfoc8hPG0UnCDXQZ51++IIPHRmgRspPjRXAHW2MG9u11E
         Wzt/oKkwfiCng/cVTLXvUJzu+EiM3D5IvqndvQQZ18ihRYhdtYfo0rxHuTHISUM77U02
         8+UKyrxNw46ou++KBThsvok4AZ6cVE3olhqDRAvgkA4wZf1noKWQDDysoUTUysMcd2V2
         S0rYCCA/gvpwjzm1W+Vnmf/MwCCUMPv+iJMAGwEn42MCHruigpO13OMDvDaogEtX8Gyt
         xPmWbesIjfene/Z5oJymVYM62YRPs0y4W04LaHnIKWvKXfoo3ThGKlS/HynHGRWt7Ckm
         A9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719085341; x=1719690141;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcJbsy2jm25GAUnNM9Xcuj1AU2NBoRKuw3UTI9/38rM=;
        b=NJfoLlQ7BjI1DOxKdBrnqpcZFmor3AT0S14MeFmDuFxQC2Xsy5BX2p4M6SaDeXuSH9
         kN9nMPf6flNIuhfQfOdvJPyP+ObmKP/VzuzYLyNAXs0W18l28SRM/SRWxE2/pi4kuBgW
         w15trPS3NCQmJ+/W/LlDllPzlxUGitbae41O923mY4KocJz0jI0yV1k4cL/5savQO3B7
         1z9LtZnFP65nSqL7jSw3dIKdXzP5+APEaBUIbxqpvM7o/phaof6iPIQ2d9FuKir6KN7J
         XlVK3YvErTc8xJQJxRHCXUMTRY0oZSprAb14rN97moykdXSU/akdgd2qjYC09EDnS8OK
         oplQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJJTaFbBefm85hWfzlLoZu8xfGBZxFcIsNkCMFJm2PEYQEDb3h1xIY14rd3ScQAxTneeDkycMzYe3vtbHMZrAGi56fgeJqt3zgbTw=
X-Gm-Message-State: AOJu0YwGPXSLDQwnFOgDffIej/d2iqiaix/GHPfcpQjldUcArRwd8EAY
	NbQxYZL2HQh7Nyhc6kyC8lm7no1SqzzOHnaUbCYQBLvTZoJmERBMJoXCFbPNNnf/2s+GzBPE/on
	tzMDC/zIWmRyzOugK5vkpaKtWADk=
X-Google-Smtp-Source: AGHT+IHzsJQQOfin1lQogznzEbzzUuyUAsOIZxSoPdvWF+xwgTub0+dgEi+j5N2GsC7SCJXZSGwdHtVAkmpj8apv+OE=
X-Received: by 2002:a2e:8250:0:b0:2ec:eee:f19e with SMTP id
 38308e7fff4ca-2ec5b3888a8mr3097551fa.37.1719085340800; Sat, 22 Jun 2024
 12:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Sat, 22 Jun 2024 21:42:09 +0200
Message-ID: <CADomA4-TnSKthXDKA6f=o29he+Mt-ZxAcyTHkPRD3MVVkDBCKA@mail.gmail.com>
Subject: Re: [PATCH 6/8] power: supply: axp20x_usb_power: Add support for AXP717
To: macroalpha82@gmail.com
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, lars@metafoo.de, lee@kernel.org, 
	linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, macromorgan@hotmail.com, robh@kernel.org, 
	samuel@sholland.org, sre@kernel.org, wens@csie.org
Content-Type: text/plain; charset="UTF-8"

sysfs correctly reports presence of USB power and voltages, tested on
RG35XX-H (H700)

Tested-by: Philippe Simons <simons.philippe@gmail.com>
