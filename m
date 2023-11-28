Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151746B87
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 20:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUj0GCWk"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3580b94ac2eso20080705ab.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701202075; x=1701806875; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zyt3AA9rAsrEEbanfY0RJVuBD8G7Bab+3ER5tFRgGnw=;
        b=NUj0GCWko5BRQN3NN1mNbgWchGoUvuStogNV6a6xM6h2CYvQzWpCrF89mGQsst3Egg
         yBcmHOJfGyfmBcNwbvLPy+oyJ06s0FeT/txuNcl3J5NvXOGmZaagqI8ktR+IQHuMstUc
         rAGzDcdxgRpIQUI/IUZmMA5qnFt9JBwHYLT7WM/9zBPLRaQSFg6S5K/h88XfLit8TIA7
         1zqFddt+laxBZ1Eaor/mYZCfYkK/tO1wqZbFWy173tEpl7qMB/TYWf26pdIEzNGmr3rx
         cBxgs8qvkQI2naiFwk5s/J55gWXZY+iqFMcTOQfx8fqShD8vA3rjRo12M1bj7YbhOdne
         EnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701202075; x=1701806875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyt3AA9rAsrEEbanfY0RJVuBD8G7Bab+3ER5tFRgGnw=;
        b=MdGTxcSu76Op/KsG6ntgxIm3lFFQ2xovH7BDu0Ohp7Ja22fWhB9ObH02qhmeKN66g/
         reCvka8qgM5+uvoPc1+zN4GOzl9cj9QV5XJHd2waabeQVLDFuzZjVlgEm92Re1K1R8O5
         UZXsIXZv1Z/QAePIScVz1ds/Os5HRx8gnp9T7iuaje51Mjsiyjba538Vg35dbIxmgJIp
         XrPPUShtQNFJFC0JP+hjzkNASNX90CAo/oCNDR9NOVssTTAz3grp9abIhYVTvuWns/w2
         SW8YhciEdtFkKzfgEE2FYeE7DK48qlP9UK0q+DcC9dh2cOKJTTVXUbd401BWfX4wPyc6
         zTJw==
X-Gm-Message-State: AOJu0Yxbkl2OzIJ7MmLNnRkVe1F+xa+DVj9L/SPJIoRGQC6SseAfrDNi
	AfbVBOeVkBULtRhYdupOQZU=
X-Google-Smtp-Source: AGHT+IFQme9ulTecymjfUGWzrk6/Wcnnu4qGKF32CqYFYV1jLahNY/c5ufGYsOOLoMGlGeDVTqATiQ==
X-Received: by 2002:a92:c603:0:b0:35c:debc:94f8 with SMTP id p3-20020a92c603000000b0035cdebc94f8mr7955462ilm.10.1701202075192;
        Tue, 28 Nov 2023 12:07:55 -0800 (PST)
Received: from [192.168.1.3] (d23-16-72-139.bchsia.telus.net. [23.16.72.139])
        by smtp.gmail.com with ESMTPSA id fi35-20020a056a0039a300b006cb8ceeea62sm9258194pfb.55.2023.11.28.12.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 12:07:54 -0800 (PST)
Message-ID: <5d7ea381-2a57-46f7-85c6-2bcad339d1db@gmail.com>
Date: Tue, 28 Nov 2023 12:07:54 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: mdt_debug write
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Vignesh R <vigneshr@ti.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20231114013106.31336-1-andre.przywara@arm.com>
 <20231114013106.31336-4-andre.przywara@arm.com>
 <0eab5c21-4fdc-478e-9071-f43c12e01fb3@gmail.com>
 <20231126002349.55404e43@slackpad.lan>
 <465a5608-89f7-4691-a2e0-ebec9b85d994@gmail.com>
 <20231126122342.3944cad5@slackpad.lan>
 <d8862c87-072d-4f74-bb37-08f34c610cc8@gmail.com>
 <dae3bee5-e1c7-4154-959c-e41dabb5d844@gmail.com>
 <20231128013746.23648d39@slackpad.lan>
Content-Language: en-CA
From: Stephen Graf <stephen.graf@gmail.com>
In-Reply-To: <20231128013746.23648d39@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Below is the consol log from trying to use mtd_debug write. It returned 
immediately with a strange success message.

root@orangepizero3:~# mtd_debug write /dev/mtd0 0 0xf0000 
/home/sysadmin/u-boot-sunxi-with-spl.bin
file_to_flash: fread, size 0xf0000, n 0xf0000
fread(): Success

I then used the cat command to write to the SPI flash which took a few 
seconds to execute:

root@orangepizero3:~# cat /home/sysadmin/u-boot-sunxi-with-spl.bin > 
/dev/mtd0



>>>
>>> I tried to follow the u-boot documentation on writing the SPI flash but
>>> had problems with the write command.  When issued it returned
>>> immediately. The erase command took about 5 sec to execute. I researched
>>> use of mtd commands and got a suggestion to use cat instead, which worked.
>>>
>>> "root@orangepizero3:~# mtdinfo
>>> Count of MTD devices:           1
>>> Present MTD devices:            mtd0
>>> Sysfs interface supported:      yes
>>> root@orangepizero3:~# mtd_debug erase /dev/mtd0 0 0xf0000
>>> Erased 983040 bytes from address 0x00000000 in flash
>>> root@orangepizero3:~# mtd_debug write /dev/mtd0 0 0xf0000
>>> /home/sysadmin/u-boot-sunxi-with-spl.bin
>>> file_to_flash: fread, size 0xf0000, n 0xf0000
>>> fread(): Success
>>> 
>>>
