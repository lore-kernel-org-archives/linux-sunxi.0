Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16CB446D1
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177852; cv=none; b=JFNzU9KGQtLES5nQ9Xxi06xZvVu5AoHQYCcp8/8g7Hv/xmJXPYgR36fdmyae8QnWT11uGUM7KCgGVcRKUc5RStitddZhZIqQjrlbFecwbkBhSJJTU3lGRfM0ycGWPG9iUWVA2mK7aeb4o9lp0qJlXIWEvB3r6I+SAEsL0ix3Dbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177852; c=relaxed/simple;
	bh=Atau1URvHwfFT5T7PHKE6HiDVTXw/ms+8/vtB9x/KUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6vBRTwyndUT5JDZh3xabpBZzxoS9xBruMbQ0uHt0stQAFcDGRjJFEdY3KzqvTiCXQJfZujeGzsEVHz8BX8V2E4YCrKHnkvtG90TOhxW1nqk0FLqnZ1U7ZoPwxnpyzVfPYvtlTZu9d6pzpCUfYBECLLcEYYCo/6BlyNBzJ6JMUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flCRBdpu; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flCRBdpu"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa7873bab2so790402276.1
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 10:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717177850; x=1717782650; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Atau1URvHwfFT5T7PHKE6HiDVTXw/ms+8/vtB9x/KUk=;
        b=flCRBdpu2nFBjJWAokAswgQhXGM529c6h6QWYIu1DwWLCq+YTScqXhmQeOS46juYWh
         NgOkmUF0d7l1Ki/rquXMZy39XCekeU9SjPfIAjIxjBhXvNJw+UBn3Y6+8pHsJ9borenM
         Xg6Zg/yMGejFuucnWLY7e9GzEMRHdyG2MHSsRS7hHaH6yp7h3B+Z8AUUBGOjLVowe5ap
         8qCOLpKHYw5CXvNl9K5b12+TB8HpmG96pVvD57UnH50ATNl/ZdPKnmOxCn11P2q6LTBz
         RRo1B/8oWcqdjO50argMn4J4zqNVDZf9z0LFH/YxEj1zvxN6/a7+oU9+ZMxY3mYgKZKG
         ENxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717177850; x=1717782650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Atau1URvHwfFT5T7PHKE6HiDVTXw/ms+8/vtB9x/KUk=;
        b=F9VdgaES5PseUhQZBFTpsrIHhrfVW4kFGp8GcgZU9imzkxeSMWi2HQ3av6SR1epCww
         Ivv/KtwtTiO7EV+1dT42AN4YbWntBxQ3O681u3Z0Csmyl2Km9N1JQfhG1MtSy4WQ3kns
         a0KUmkpaMVmIcS4X9UuGBQQOe2Oomvy1z1XcoiypCRmbG0k8kCM/gX4MrzJYHTKsas2d
         X3mUWD2EOY2YJLCowU0EB+XqsjVIpCyPs/psUdhhS7ibhkIRMYCwOVw/Lyte3Wj7bpfG
         nmKHWfB1hFa/x5YEKWn5lRGvyROXyjAX6jfTdOE817ySZ5QJ2omD1e+xy2tq7b0Ds87/
         nxHg==
X-Forwarded-Encrypted: i=1; AJvYcCU01CzqoL0IK5oF7QbB43FfkoT/IPCRqxmP556739Ua772hxo+Jn/C/3Xzwv3sbN/UDvNmU/N2esjNgVYYlfiGwByjOmsCKGG5RzY4=
X-Gm-Message-State: AOJu0YyY5OXH9mleo5ux7N7kez/UBW4oSeGppg79WeyKak7fOMSMWNff
	x+NjW4w5fge3lUJRdP/inKwzk2z23+fjlOjjyb9hFqSQHprNr2c/296LtM5RnDCAtfbgzU66hqC
	YScgGXh9SjxVDWAw/GT+XX6/sqtQ=
X-Google-Smtp-Source: AGHT+IGfpgVBtSJVjCqXGnH8H64qsE/dutU25hN1mvv7gHBogYjfdAizPMz6GykYygm4KbQ5mpPzr4sUablf1PT9yKU=
X-Received: by 2002:a25:e0cf:0:b0:dfa:4adc:e91c with SMTP id
 3f1490d57ef6-dfa73db1bc5mr2847810276.48.1717177849523; Fri, 31 May 2024
 10:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240531141152.327592-1-kikuchan98@gmail.com> <20240531141152.327592-4-kikuchan98@gmail.com>
 <18d98f83-aeee-4022-b418-ed6e81988d27@kernel.org>
In-Reply-To: <18d98f83-aeee-4022-b418-ed6e81988d27@kernel.org>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Sat, 1 Jun 2024 02:50:37 +0900
Message-ID: <CAG40kxE-gwJ3O5LWb5FfQm5UwFGgdvNgQoeNRJTZHi-uT92pOQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pwm: sun20i: Add compatible string for
 Allwinner H616 PWM
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Aleksandr Shubin <privatesub2@gmail.com>, 
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Krzysztof,
Thank you for your reply.

> There is no such file and there is no dependency (lore link) neither
> here nor in cover letter.

I'm so sorry, it's based on the patch series:
https://lore.kernel.org/linux-sunxi/20240520184227.120956-1-privatesub2@gmail.com/T/#u

Best regards,
kikuchan.
