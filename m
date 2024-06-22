Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966074597A
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719085445; cv=none; b=RuNXHRrDTQxDJZ4zVm/55fyjR4EqCqqM2UB544DbwXcG04ufsC3K1kaAJxRJC+zLe8AmWv7wbI75LsDtn2VEXCfOAO1zYmrg4SQ26gJRfzSvFlr9WxMPjnsiGjMq+jKYbTmienJkuQD1CkKl27wfFUB6JhELTzGdQapklkGY35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719085445; c=relaxed/simple;
	bh=UHxiMaN0gFhW4g55UEEwn7/X8WHo6sNRA+kFdfZOlIc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U1EO3g1R4ni/pwQXQGStTnELKp763cIM9S7/412xH/uq/LQlRC3o9McNnFzdvIc2/Kw4gH7VTOYj1ubeO1nCPxnroFvb6vsFpyl8hScXJCzm/ezqE6DNhCKUUUNX+1lkZVPtYEhM9ZF9S/nG3xau5laRATIf7+MzNCybKlXgCL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY+2d5MU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY+2d5MU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d10354955so3396214a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 12:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719085442; x=1719690242; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UHxiMaN0gFhW4g55UEEwn7/X8WHo6sNRA+kFdfZOlIc=;
        b=UY+2d5MUPZbc54aYeuggIJJzuAFr92/AZ7kQvKEO/yxl8Oauop7n4dfm1rEbmmsVIf
         oiKNoPNbk7Z8SjoLp1C23JZkIU3xPXPjt3h4hLMirSXZ/533IWocB8oHENcHRbVmZ8A4
         AqEwL+QwQWHHUi5jzhfjZ1yOfU/IZ8solRBoMtR3oPreQeB7bADT8IOC1s8yHMH+PiCw
         czc55AiY6eUK0ZRxSQs8KXmMWh/Xxut0C2FHKN+LKxXj3aERbV/pvpkXUQBF8UbhyJS4
         y3k1Z0okZlkGo1J4DxrkrSWTuYzPIlpnWHr1E7jD/Pp8d+3LwzDu6DNWS2peBxV9mR/f
         5Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719085442; x=1719690242;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHxiMaN0gFhW4g55UEEwn7/X8WHo6sNRA+kFdfZOlIc=;
        b=QFfKrdwUUicqk1iUfq0Izk5UfRXx/xW1OuAOHflogyCQxZf62XFWg7YsO8+e36k3pD
         724kKG+jjsbbn9BbLznR9beBVk/VjdBWrpmY07tVfGgpa4x+7JmrMzHfTmtwZyjK572P
         2pLGQR+jO9A43l1u3v6PlNxItjbwrMgtVbXP+UDaqqtciLfvtbLyWYd90am0kqeGMaKq
         Hfs8b3eHOA53CxFKDEmHwlLJfF8Lq3Zd1cVbD2QgKjlUJzd8B3qne9Ix+RzckRpOllyz
         PSHomvLpdO85X7UZIC28yg1IfmuHlmhsHN/BV+Nu/vK+5b5lZmPbo+XS2kiJa/xX0vt5
         9Pzg==
X-Forwarded-Encrypted: i=1; AJvYcCWzbvxX46rYJqli9jRLRY3RkMTlA/UptNsk8nB0/rHB+C6BV1xKgsUXesLkSq7yQFk7QfVbqSpsCao5O6YpcMX6d3s+eUBVXem7Sbk=
X-Gm-Message-State: AOJu0YwNUCsFNkzhgxtrUalsJOW/Xbr3sDrb/QGabaxBsw5hACeMAQjA
	dCkUPOJM6DxZgHKqSSP8kn84yECwFQXMb7b2vw7Kg+W9I9M42EeD5CH9Br96jyVDk/hof8glm9v
	tJpoJ/eGH/iFnuwcIcsJDMlnKoqc=
X-Google-Smtp-Source: AGHT+IGBVQKMPe0M8mY48RH3WL+xzP9JIJywn8bTvbczBfmZEJoCfLWW5yCSoIOe3OKwAcDMgURS5hQXij0URVEfi+0=
X-Received: by 2002:a50:8e53:0:b0:57d:105c:c40c with SMTP id
 4fb4d7f45d1cf-57d49dc29d1mr698479a12.24.1719085441809; Sat, 22 Jun 2024
 12:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Sat, 22 Jun 2024 21:43:50 +0200
Message-ID: <CADomA48AbhFaQ2yWpBYfsTiBLyGDMeqbNbxhU_j1Oi2DEeaxAw@mail.gmail.com>
Subject: Re: [PATCH 7/8] power: supply: axp20x_battery: add support for AXP717
To: macroalpha82@gmail.com
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, lars@metafoo.de, lee@kernel.org, 
	linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, macromorgan@hotmail.com, robh@kernel.org, 
	samuel@sholland.org, sre@kernel.org, wens@csie.org
Content-Type: text/plain; charset="UTF-8"

sysfs correctly reports the presence, voltage and current of the
battery. Tested on RG35XX-H (H700)

Tested-by: Philippe Simons <simons.philippe@gmail.com>
