Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F7432C8E
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Jun 2024 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717836502; cv=none; b=n/ki5SV0ayPpHrHeVe667iU4rCqIQPh3iOu3n7PoftVhs0nn+gyPWLas7PdN+cp/gWpFa4kKG5ZPkyRWYZzeQELOvn8kD/pb2dVnZG4TDEzrO3kHqtuN416WfS/F6yJTO6GHvISbccNKBdkHXxhQDcGRKLoJufwHRjBGS7iLqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717836502; c=relaxed/simple;
	bh=kjW/OwKE/38nsTgfKPv6P/u0Ov0EctGEAhg2D4hqOUo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bFfNlnCmVM1KeosQUtqWXsiU50pab5W2QmJBVw1TLP7QMcYGoIg+929wFtY/oZfhm0ASAWC8coHHDIs0cvX5QDnhi0gSFiV8zMiqmHFfjjoHtYD6wqZnThAHzzPq03b615kldJCzGe3HEm8kCCiyMApeqEE1YSnjh7Q8qfE52Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaQ8EKUu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaQ8EKUu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57c6994e2f1so283641a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Jun 2024 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717836499; x=1718441299; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kjW/OwKE/38nsTgfKPv6P/u0Ov0EctGEAhg2D4hqOUo=;
        b=OaQ8EKUuT/O6pAeDIM47xVDdw1YH4wYw/vCeHRfBRbGmbnzVCXkOUQczOd7ayINbzz
         0qnYHqBnNZemi+zWhT10R1bNeNBtgwLSIUlS52fh8AIzyzzitunRMTKr+Af3DlSbMlK1
         tCYfr0hiFJe+V7UB0fYkbCvG+SYien8zjHZpO3ltsSqyR+W1G7+DmeIeuK+SbHwHWZxC
         QA6PakDd33Oz2xwRgL5BAkeuXxp4vr/SWZT19n0gYZAvUrnjm5vHrc5/W9jLhMto0xxs
         wN+a8L0CUOJ9ewI4IEdl6kcXLmjG6KysC0Nv6WApZ08jVDOB4dJNwWq2gzdkd1eS2RNq
         upoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717836499; x=1718441299;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjW/OwKE/38nsTgfKPv6P/u0Ov0EctGEAhg2D4hqOUo=;
        b=w4Irt9+11UCpivY6HIXFDsml250dnj6QAtHhP0rZ5YzsVVEO0PLOjIkWdVluByyoRU
         rcGlSfjZvv7lPKS0gW9/aClmkAC68UTmDTThelunBshxyj8LpQAvw514Znd//N4p+Dft
         g4jXiPIZzJ+hfCdAVZLIdrfGQXV/NW1+BRd9CfkIyQOuStD1+wvWCCuoOwBlQgFTc4qc
         0udgwygw4bbPJMYO5qxJ91Vg/KSM9e0+IF0v9WVU4hqJIKdTx7S3LxBU+1zhN5h6rh9R
         oHwjihTnoa+O7fggLQeIkfO/sSNrGI9jjWF4A//0En3vBYgDTgbBmXteHYWDMvYpSMak
         zt8g==
X-Forwarded-Encrypted: i=1; AJvYcCXKiBjK87HAv0z01KTtClS6oVcoTgSGzN6x+iDbmlDG3roJu75bp31b7K4yEb5VJzoHR+K+B3guELZYVj02K7DgKrq70yBzfYgazDQ=
X-Gm-Message-State: AOJu0YzvZb3e98JosSpzOvhB0xoZrkimEbsfWcXvzmOiYmFmqo1tFrND
	USWILUBZszLgYMaIscAIXK4unnIIG7Coz1b3db00nDJu9Uda+YTjpKCMdFx+rWoI0I0lW9wtHus
	a2x05gxxeRYmBjuIYDikynPwkYb8=
X-Google-Smtp-Source: AGHT+IFeamgLDpai9z4xWPUhmP3JtUBJe5qabz+gPMtryfDxWnrxGjd+hEyDlCii8DSshBAi7pMeYYeK+vSi8R4mmMs=
X-Received: by 2002:a50:d683:0:b0:57c:72ee:a864 with SMTP id
 4fb4d7f45d1cf-57c72eea910mr149969a12.42.1717836498378; Sat, 08 Jun 2024
 01:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Sat, 8 Jun 2024 10:48:07 +0200
Message-ID: <CADomA48qTvjvxURRBbyiiScM=jg9k4x+bPktSG03+fyW5VpEDA@mail.gmail.com>
Subject: Re: [PATCH 0/3] cpufreq: sun50i: add Allwinner H700 speed bin and
 additional OPPs
To: ryan@testtoast.com
Cc: andre.przywara@arm.com, conor+dt@kernel.org, jernej.skrabec@gmail.com, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev, macroalpha82@gmail.com, 
	nm@ti.com, rafael@kernel.org, robh+dt@kernel.org, samuel@sholland.org, 
	sboyd@kernel.org, sudeep.holla@arm.com, tiny.windzz@gmail.com, 
	vireshk@kernel.org, wens@csie.org
Content-Type: text/plain; charset="UTF-8"

Tested on my RG35XX-H, no issues

Tested-by: Philippe Simons <simons.philippe@gmail.com>
